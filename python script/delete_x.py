import os, time, sys

folder_path = "C:\Users\meva\Temp_workspace\Delete_files_over_28"
#file_ends_with = ".txt"
how_many_days_old_logs_to_remove = 30
now = time.time()
only_files = []

for file in os.listdir(folder_path):
	file_full_path = os.path.join(folder_path,file)
	#Delete files older than x days
	if os.stat(file_full_path).st_mtime < now - how_many_days_old_logs_to_remove * 86400: 
		os.remove(file_full_path)
		print "\n File Removed : " , file_full_path
		