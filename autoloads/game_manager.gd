extends Node

# Import CSV data via FileAccess and return it as array of dictionary with the headers as the keys
func import_csv_data(file_path) -> Array:
	if not FileAccess.file_exists(file_path):
		return []
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	var csv_data = []
	
	# Get headers of the csv file
	var headers = file.get_csv_line()
	
	# Access each row and make dictionary for each row
	while !file.eof_reached():
		var csv_row = file.get_csv_line()
		
		var dict_row = {}
		
		for i in range(headers.size()):
			dict_row[headers[i]] = csv_row[i]
		
		# Append the dictionary to the main array
		csv_data.append(dict_row)
	
	return csv_data
