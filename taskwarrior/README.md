# How to manage my tasks
This is a documentation of how  want to go through my task list. It's more a reference for me than anything else but I thought wh not put it with all my other task stuff. This is heavily imspired by the GTD philosophy. I have also followed [this tutorial](https://hamberg.no/gtd) and am modelling most of my workflow based on this.

## In list
The _In list_ will be the dumping ground for all my tasks. This is where any thing I want to do I put. Maybe once or multiple times a day I can then process the in list as described below so that I can modify and create tasks properly.

To add to the in list I need to add the tag `+in` to any in task. Any task with this tag is considered part of the in list. The alias for this is `in` so I can just go 
```
in think about how to make a task list
```

To view the in list I have the alias `tin`. This will show you all tasks in the in list.

## Processing
Processing means we firgure out what to do with an item on the in list. The process to do this is described below. However this also means that I have to remove the `+in` tag on every task in the in list. Thus there is the handy `tproc` alias that removes the in tag and then behaves as the `task` command.

### Actionable tasks
When processing I need to make sure that the tasks I create are actually actionable. IF a task is not actionable and not in the in list, it should not be part of the task list. So now we can modify the above added task like
```
tproc 1 +personal +productivity project:TaskListSetup Read article https://hamberg.no/gtd on how to do GTD
```

### What to do with an in task
#### Is this the next task in the project?
If it is, add a `+next` tag to it. This would make it appear in the _Next list_ at a high priority.

#### Am I waiting on this task for someone?
Add it to the waiting list so you can be reminded about it after some time. [The task warrior page on dates](https://taskwarrior.org/docs/using_dates.html) is a great page on how to handle dates. If you are waiting for someone, add a `wait:2w` on it, and you will be reminded in 2 weeks about this.

#### Is this something I maybe want to do?
Add it to the _Someday list_ by appending the +someday tag to it. Or you could just wait for it, i.e. incubate it. You may want to use `scheduled:mon` to start looking at it on monday.

#### Is this somethign to be done on a specific date?
Add this as `due:2020-11--30` so that I can be reminded. 

## Contexts
I still need to figure out how to do these basically. CUrrently I am thinking of contexts for

  - Home
  - Office
  - Before leaving home
  - Grocery
  - Books'
  - Specific people

## Birthdays
It would also make sense to add birthdays to this so I can wish people properly


