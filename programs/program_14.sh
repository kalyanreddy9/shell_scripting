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

# TODO
## need to add process contraol scripts and eamples 