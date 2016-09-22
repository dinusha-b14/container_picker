require './lib/container_picker'

puts 'Welcome to the Container Picker application'

print 'containers: '
containers_input = gets.chomp

containers = containers_input.split(',').compact.map(&:to_i)

picker = ContainerPicker.new(containers)

print 'size: '
size = gets.chomp

selected_containers = picker.choose(size.to_i)
puts "Containers Selected: #{selected_containers.join(', ')}"
