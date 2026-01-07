# vim: filetype=sh
# This file defines all the aliases I need for my shell which use task warrior
# 
# Add a task to the in list.. i.e. a task with the tag `in`
alias in='echo "🤔 Adding task to in list";task add +in'

# A command to help process tasks.
process_task() {
  # If no id was supplied don't do anything
  if [ "$1" = "" ];then
    echo "No task id found 💥"
    return 0;
  fi

  # This selects all args other than the first which is the task Id
  # See this for the syntax https://stackoverflow.com/questions/9057387/process-all-arguments-except-the-first-one-in-a-bash-script
  rest_of_the_args=${@:2}
  echo "Processing task ⚙️  $1"
  command_to_run="task $1 modify -in $rest_of_the_args"
  eval $command_to_run
  # Notify what commmand was run just in case
  echo "Task $1 processed with the following command 🤖"
  echo "$command_to_run"
  # No time is a bad time to commend your self
  echo "Good Job!! 🎉"

}
alias tproc=process_task

alias tin='echo "📨 In report"; task in'

# Add a task which I should be reminded about later on
tickle () {
  echo "You will be reminded ⏰"
  taskId=$1
  deadline=$2
  shift 2
  tproc $taskId wait:$deadline $@
}

# ALias `tickle` to just tick because lazy
alias tick=tickle
alias twerk="task +work"
alias tchow="task chow"
