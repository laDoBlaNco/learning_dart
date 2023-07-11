/*DSAD - Chapter 2 - Complexity
 * 
 * Scalability means different things depending on the context. In DBase its about along
 * it takes to retrieve and save data and with Architecture its about how easy it is to
 * make changes to the system. For algorithms its about performance in terms of execution
 * time and memory usage. BIG O NOTATION
 * 
 * Time Complexity - measure of time required to run an algorithm as the input size increases.
 * Let's learn the most common and how to identify them.
 * 
 */

// CONSTANT TIME - this algo has the same running time regardless of the size of the input.
void checkFirst(List<String> names) {
  if (names.isNotEmpty) {
    print(names.first); // we are just printing the first item, nothing else
  } else {
    print('no names');
  }
} // the size of the list has no bearing on how long it'll take as its only printing a name
// So this would be a constant time O(1) algorithm


// LINEAR TIME - As input increase the runtime increases by the same amount. This is known as
// linear time O(n) (n being any number representing the size of your data)
void printNames(List<String> names){
  for(final name in names){
    print(name); // we are printing each name, to the more names the longer it'll take
  }
}


/* NOTE:
 * There are times when the algorithm is going to be a bit more complex as in it has a bunch
 * of things happening in the function. For example a function with 2 loops over all the data
 * calling six O(1) methods. O(2n+6) would make sense right?
 * 
 * Time complexity is only about looking at algos at a high-level to determine performance
 * Loops that run a set number of times or methods as well aren't considered as part of the
 * end calculation. So all constants are dropped. Meaning that O(2n+6) is really O(n) 
 * 
 * This isn't to say its not important. There are companies that spend millions to optimize
 * and reduce the slope of those constants that Big O ignores. For example the difference
 * between a GPU running 100x faster than the naive CPU with both being O(n). So though
 * we won't discuss it here, it is important.  
 * 
 */


// QUADRATIC TIME - more commonly referred to as n squared, it refers to an algorithm that
// takes the time proportional to the square of the input size. Most times this can be identified
// as a nested loop scenario
void printMoreNames(List<String> names){
  for(final _ in names){ // so for every row, for example
    for(final name in names){ 
      print(name); // we print every name. So the linear time of this inner loop is squared for each new data row.
    }
  }
}
// so for example is we have 10 pieces of data, it'll print the 10 names 10 times, which is
// 100 print statements. 
// This is normally denoted as O(n^2) 

// NOTE: No matter how inefficiently an O(n) algo is written, for a sufficiently large n, the
// linear time algo will execute faster than a super duper optimized quadratic algo. Always
// Every time.

// LOGARITHMIC TIME - 



///////////////////////////////////////////////////////////////////////////////////////
// MAIN
///////////////////////////////////////////////////////////////////////////////////////

void main(){
  
}