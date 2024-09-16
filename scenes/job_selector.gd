extends Control

# Array of job to store the imported job data from csv file
var jobs: Array[Job] = []

# UI elements variable
@onready var option_button = $MarginContainer/PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/JobOptionVBox/OptionButton
@onready var job_name_label = $MarginContainer/PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/JobDescriptionVBox/JobNameLabel
@onready var description_text_label = $MarginContainer/PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/JobDescriptionVBox/DescriptionRichTextLabel
@onready var skills_item_list = $MarginContainer/PanelContainer/HBoxContainer/MarginContainer/VBoxContainer/SkillsVBoxContainer/SkillsItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	create_jobs(GameManager.import_csv_data("res://resource/class.csv"))
	populate_job_option_button()
	# Initialize the default job to of index 0
	initialize_job_selected(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Instantiate every job in jobs_data and store it to array of job
func create_jobs(jobs_data: Array):
	for i in range(jobs_data.size()):
		var job = Job.new(int(jobs_data[i]["ID"]), jobs_data[i]["JOBNAME"], jobs_data[i]["DESCRIPTION"], jobs_data[i]["SKILLS"])
		jobs.append(job)

# Populate option button with the content of array of job
func populate_job_option_button():
	option_button.clear()
	for job in jobs:
		option_button.add_item(job.job_name)

# Initialize selected job by displaying the correct job datas using index
func initialize_job_selected(index: int):
	option_button.select(index)
	job_name_label.text = jobs[index].job_name
	description_text_label.text = jobs[index].description
	# Clear skills_item_list before using job's skills (PackedStringArray) as the new values
	skills_item_list.clear()
	for skill in jobs[index].skills:
		skills_item_list.add_item(skill)


func _on_option_button_item_selected(index):
	var selected_job = jobs[index]
	job_name_label.text = selected_job.job_name
	description_text_label.text = selected_job.description
	# Clear skills_item_list before using job's skills (PackedStringArray) as the new values
	skills_item_list.clear()
	for skill in selected_job.skills:
		skills_item_list.add_item(skill)
