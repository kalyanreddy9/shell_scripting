# Environment Variables and Their Usage

echo "PATH: $PATH"  
echo "Home Directory: $HOME"  
echo "Username: $USER"  
echo "Current Directory: $PWD"  
echo "Language: $LANG"  
echo "Primary Prompt: $PS1" 

# Temporary PATH change

# Add the new Terraform to PATH temporarily
export PATH=/opt/terraform/1.6.0:$PATH

# Check which version will run
terraform version
# Terraform v1.6.0

# This change only affects the current terminal session.


# Permanent PATH change (for all sessions)

# Open your shell config file (~/.bashrc or ~/.zshrc)
nano ~/.bashrc

# Add this line at the end
export PATH=$PATH:/opt/terraform/1.6.0

# echo 'export PATH=$PATH:/opt/terraform/1.6.0' >> ~/.bashrc

# Save and reload config
source ~/.bashrc

# Sourcing Configuration Files

# Sourcing a file means executing the commands in that file in the current shell instead of starting a new shell.

# This is different from just running a script normally (./script.sh), which executes in a subshell.

# When you source, any changes to environment variables, functions, or PATH remain in the current shell session


source filename

# or the shorthand:

. filename   # dot followed by space
# Both do the same thing: execute the file in the current shell

# Sourcing = load everything into current shell.

# Functions and variables = available repeatedly.

# Changes to PATH, ENV, etc. = persist in current session.