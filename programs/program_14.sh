# Subshells and Process Control

# In Unix-like operating systems, a subshell is a separate instance of the shell 
# that is spawned to execute a command or a group of commands. Subshells are useful 
# for various purposes, including isolating variables and managing process control. 
# Additionally, process control involves managing background and foreground 
# processes to efficiently multitask and manage system resources. 

# Running Commands in a Subshell: 
# Running commands in a subshell is achieved by enclosing the commands within 
# parentheses ( ). This creates a new shell instance to execute the commands.

# Example -1

# Suppose you’re writing a script that changes directories temporarily:
# But if you don’t want your main script’s working directory to change permanently,
# you can use a subshell:

(
  cd /tmp
  echo "Inside subshell: $(pwd)"
)
echo "Outside subshell: $(pwd)"

# Inside subshell: /tmp
# Outside subshell: /d/shell_scripting/programs


# You can use a subshell to run something with temporary environment variables

(
  export ENV="staging"
  ./deploy.sh
)

# When it ends, the ENV variable is gone

# Background and Foreground Processes

sleep 5 &
echo "background process started"
# wait for background process to finish
wait
echo "background proces completed"


# In the example above, the & symbol is used to run the sleep 5 command in the background. 
# The wait command ensures that the script waits for the background process to complete before proceeding.

# Running commands in a subshell and background process  
(  
echo "Subshell working directory: $(pwd)"  
sleep 5 &  
sleep 5 &
sleep 5 &
sleep 5 &
ps -ef | grep sleep
  # KALYAN    1016    1013 cons0    08:08:24 /usr/bin/sleep
  # KALYAN    1017    1013 cons0    08:08:24 /usr/bin/sleep
  # KALYAN    1015    1013 cons0    08:08:24 /usr/bin/sleep
  # KALYAN    1018    1013 cons0    08:08:24 /usr/bin/sleep
echo "Subshell background process started."  
wait  
echo "Subshell background process completed."  
)  
echo "Main shell continues." 

# run multiple things at once using background jobs
backup_db > backup.log 2>&1 &
compress_logs > compress.log 2>&1 &
wait
echo "All done! Check backup.log and compress.log for details."

# > backup.log → sends normal output (stdout) to backup.log
# 2>&1 → sends errors (stderr) to the same file
# & → runs the command in the background
