// ignore_for_file: unreachable_switch_default

void main() {
  /*3.2 - SWITCH STATEMENT

    The switch statement compares a value against a series of options and executes
    the first match in declaration order. It's generally used when choosing from a 
    defined set of possiblities. In particular a switch statement can compare:

      ▪ compile-time constants
      ▪ enumerated values
      ▪ numbers
      ▪ strings
      ▪ classes

    The case keyword identifies the various options to be matched. At the end of the 
    options list, the optional default keyword may be used as a fallback if none of 
    the previous cases matched the item being compared. For example:
  */
  const status = Status.ready;

  switch (status) {
    case Status.ready:
      print('ready');
    case Status.paused:
      print('paused');
    case Status.finished:
      print('finsished');
    default:
      print('undefined');
  }
  /*I can see here that the switch statement is like a more readable version of an if
    when it has too many else branches to evaluate. In the example, the switch first
    evaluates status and then looks for the first case clause that matches. Here are a 
    few more examples:

      ▪ The code is equivalent to the previous one because the break statement at the 
        end of each case block is optional
  */
  switch (status) {
    case Status.ready:
      print('ready');
      break; // allowed but optional
    case Status.paused:
      print('paused');
      break; // allowed but optional
    case Status.finished:
      print('finsished');
      break; // allowed but optional
    default:
      print('undefined');
  }

  /*    It's not recommended using the break keyword when not needed. It was required
        in Dart 2.19 and lower versions but from 3.0 onwards, it is optional

      ▪ When a case doesn't have a body, it's associated with the next case. So in other
        languages where you would leave 'break' out for this, in Dart you just leave the
        body out for the "fall through":
  */
  switch (status) {
    case Status.paused:
      print('paused');
    case Status.ready:
    case Status.finished:
      print('finished');
  }
  /*    In this example, the ready and finished statuses will print "finished". This is
        equivalent, but more verbose, version of the same code
  */
  switch (status) {
    case Status.paused:
      print('paused');
      break;
    case Status.ready:
      print('finished');
      break;
    case Status.finished:
      print('finished');
  }
  /*  ▪ There is a case where the break statement is needed. For example, consider this
        code where all case blocks continue to fall through to the next one:
  */
  switch (status) {
    case Status.paused:
      break;
    case Status.ready:
    case Status.finished:
      print('finished');
  }
  /*    In this example, any value of status would have always printed 'finished" because
        they have no body. By adding a break (and thus a body to the case statement), the
        flow wouldn't fall through anymore. 

      ▪ The default case MUST always be the last statement otherwise a compiler error
        is thrown. for example, this code will not compile:
  */
  // switch (status) {
  //   default:
  //     print('none');
  //     case Status.paused:print('paused');
  // } Error: The default case should be the last  one

  /*As a guideline, its recommended to use switch statements when my program flow can
    be split into more than two branches. The if statement should preferably be used to
    distinguish between two options, not multiple ones. For example:

        GOOD:
        switch(exitCode){
          case Status.paused:
            return 2;
          case Status.ready:
            return 1;
          case Status.finished:
            return 0;
          default:
            return -1;
        }

        NOT SO GOOD:
        if(exitCode==Status.paused){
          return 2;
        }else if(exitCode == Status.ready){
          return 1;
        }else if(exitCode == Status.finished){
          return 0;
        }else{
          return -1;
        }

    So the guideline is basically not to use 'else if'. 

    Note that it's just a matter of readability. Both versions are equivalent, but the
    thought is that a switch is more readable in this case. In chapter 7 - section "Patterns"
    I'll see more advanced ways to use the switch statement
  */
}

enum Status { ready, paused, finished }
