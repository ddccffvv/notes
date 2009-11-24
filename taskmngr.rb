#!/usr/bin/ruby

require 'date'
class Note
	attr_reader :note
	def initialize(note)
		@note = note
		@date = Date.new
	end
	def to_s
		"#{date}: #{note}"
	end
end

class Subject
	attr_reader :title, :notes
	def initialize(title
		@notes = []
		@title = title
	end
	def to_s
		print title, ":\n"
		@notes.each {|n| print n.to_s, "\n"}
	end
end
	
class Task
	attr_reader :done, :title, :description, :priority, :date_added
	attr_writer :done, :title, :description, :priority
	def initialize(title, desc, priority)
		@description = desc
		@priority = priority.to_i
		@date_added = Date.new
		@title = title
		@done = false
	end
	def to_s
		"Task: #{title} (#{priority})\n\t#{description}"
	end
end

class Task_manager
	attr_reader :tasks, :subjects 
	def initialize
		@tasks = Array.new
		@subjects = Array.new
	end
	def add_task(title, desc, priority)
		@tasks.push(Task.new(title, desc, priority))
	end
	def sort_by_priority
		@tasks.sort {|a,b| a.priority <=> b.priority}
	end
	def add_subject(subject)
		@subjects.push(Subject.new(subject))
	end
end

class Gui

	def prompt
		print "command\#: "
		gets
	end

	def add_task(tm)
		puts "Title: "
		title = gets
		puts "Description"
		desc = gets
		puts "Priority"
		prio = gets
		tm.add_task(title.chop!, desc.chop!, prio.chop!)
	end
end
tm = Task_manager.new
gui = Gui.new

command = gui.prompt
while true
	command.chop!
	case command
		when "add task"
			gui.add_task tm

		when "list"
			tm.sort_by_priority.each {|t| print t.to_s, "\n"}
		when "quit"
			break
		else
			puts "Unknown command"
	end
	command = gui.prompt
end
