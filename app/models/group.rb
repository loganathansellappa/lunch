class Group < ApplicationRecord
  belongs_to :employee
  belongs_to :blind_date
  belongs_to :restaurant
  belongs_to :leader, :class_name => 'Group', optional: true
  has_many :members, :class_name => 'Group', :foreign_key => 'leader_id'

  class << self
    def create_lunch_group(params)
      prev_week = params[:week].to_date.prev_occurring(:friday)
      prev_group = BlindDate.where("lunch_date <= ?", prev_week).last
      current_group = BlindDate.find_by_lunch_date(params[:week])
      if(current_group.present?)
        current_group.groups.destroy_all
      else
        current_group = BlindDate.create!(lunch_date: params[:week])
      end

      if(prev_group.blank?)
        generate_group(params[:employees], current_group)
      elsif prev_group.present?
        prev_group_leaders = prev_group.groups.where(leader_id: nil).map {|leader| leader.employee_id}
        generate_group(params[:employees], current_group, prev_group_leaders)
      end
      #
      # # TODO
      # # WE CAN SEND CALENDAR INVITE TO THE EACH IN BACKGROUND
      # # leaders = current_group.groups.where(leader: nil).includes(:members)
      # # leaders.each do |leader|
      # #   leader.members # -> Member in the given group doesnt include leader
      # # end
      #
      return current_group
    end

    #
    # Regenerate the list or create new
    #
    def generate_group(employees, current_group, prev_group_leaders = [])
      @employees = employees.count > 5 ?  shuffleEmployee(employees) : [employees]
      @employees.each do | employee_group |
        @leader = nil
        #
        # Select Restaurant by default, we may move this to separate view for leader to select also
        # Currently I just preselect
        @restaurant = Restaurant.order("RAND()").pluck(:id).first
        employee_group.each do |emp|
          if(@leader.present?)
            Group.create(blind_date_id: current_group.id, employee_id: emp, leader_id: @leader.id, restaurant_id: @restaurant)
          else
            lead = (employee_group-prev_group_leaders).empty? ? emp : (employee_group-prev_group_leaders).first
            @leader = Group.new(blind_date_id: current_group.id, employee_id: emp, restaurant_id: @restaurant)
            if(lead != emp)
              @leader.leader_id = lead
            end
            @leader.save
          end
        end
      end
    end

    #
    # I was not sure whether we need to shuffle the people between teams
    # Just added as I have not received feedback for my queries
    #
    def shuffleEmployee(employees)
      teams = Team.joins(:employees).where("employee_id in (?)",employees).uniq
      @emp = []
      teams.each do |team|
        if(@emp.any?)
          @emp.push(team.employees.where(id: employees - @emp.flatten).pluck(:id))
        else
          @emp.push(team.employees.where(id: employees).pluck(:id))
        end
      end
      return @emp.flatten!.shuffle.in_groups(2, fill_with=false)
    end
  end
end
