class ContainerPicker
  attr_reader :containers

  def initialize(containers)
    @containers = containers
  end

  def choose(size)
    @remaining_load = size
    @result = []
    while @remaining_load > 0 do
      selected_container = container_with_least_remainder
      @result << selected_container
      @remaining_load -= selected_container
    end
    @result
  end

  private

  def reverse_sorted_containers
    @reverse_sorted_containers ||= containers.sort.reverse
  end

  def min_container
    @min_container ||= reverse_sorted_containers.min
  end

  def container_with_least_remainder
    selected_container = min_container
    current_min_remainder = @remaining_load
    minimum_container(selected_container, current_min_remainder)
  end

  def minimum_container(selected_container, current_min_remainder)
    reverse_sorted_containers.each do |container|
      remainder = @remaining_load % container
      next if remainder >= current_min_remainder
      current_min_remainder = remainder
      selected_container = container
    end
    selected_container
  end
end
