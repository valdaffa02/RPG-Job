class_name Job
extends Node

# Job class' attributes with their getter and setter
var id: int:
	get:
		return id
	set (value):
		id = value

var job_name: String:
	get:
		return job_name
	set (new_name):
		job_name = new_name

var description: String:
	get:
		return description
	set (new_description):
		description = new_description

var skills: PackedStringArray = []:
	get:
		return skills
	set (new_skills):
		skills = new_skills

# Constructor
func _init(id, job_name, description, skills):
	self.id = id
	self.job_name = job_name
	self.description = description
	self.skills = skills.split(";")
	self.skills.remove_at(self.skills.size() - 1)
