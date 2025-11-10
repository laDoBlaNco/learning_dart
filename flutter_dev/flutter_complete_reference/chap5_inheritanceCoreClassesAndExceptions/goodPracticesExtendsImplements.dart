/*5.1.4 - GOOD PRACTICES: EXTENDS VS IMPLEMENTS

  I've just seen that 'extends' creates subclasses and 'implements' is for interface-like
  behaviors. While they may seem similar, there are differences in how they work and their
  use cases. To get started, I'll do a 1:1 comparison:

    1. When I use class B extends A{} I'm NOT forced to override every method of the
       superclass A. Inheritance takes place, so I can override as many methods as
       I want.

    2. When I use class B implements A{} I AM forced to override EVERY method of class
       A. Inheritance does NOT occur since all methods implementations must be re-defined.

  Here are the differences between 'extends' and 'implements' from a practical viewpoint:

    1. 'extends'. I should use it to get the typical object-oriented behavior (where public
       members can be overridden, if needed) and I wish to share common behaviors along 
       hierarchy. If two classes share the same library, I can also override library-private
       members, but that is NOT considered a good practice.

    2. 'implements'. I should use this when I need to create the "contract" of a type
       without its concrete implementation. If two classes share the same library, I'll
       be forced to also override library-private members, which is generally not a 
       good practice. It would be better if classes treated as interfaces lived in their
       own file.

  Abstract classes and interfaces adhere to object-oriented programming paradigms. 
  Before moving on, I should review two simple use cases to show how 'extends' and
  'implements' can be used. In general:

    1. When I have one or more common behaviors for all the children along the hierarchy
       I should use 'extends' to take advantage of inheritance. For example, imagine I 
       had to create a utility to r ead the contents of various file formats:
       (FileReader)

       Now regardless of the file format, in this example I always want to be able to
       retrieve the file path and whether it's absolute or not. To avoid repetitions,
       I can place members in this superclass so that any subclass will inherit both
       'path' and 'isPathAbsolute'. Subclasses will only have to take care of the file
       parsing logic: (TextReader)

       If I used 'implements', I would have had to copy/paste the getters implementation
       across all types. Using inheritance is the right choice since it allows me to 
       REUSE existing code across the hierarchy and avoid duplications.

    2. When I don't have implementations to share across the hierarchy but I just need to
       define the structure, I should use 'implements'. for example, I would treat a
       class an an interface if I had to create some sorting algorithms for collections
       of data: (Sorter)

       In this example, I expect all the algos to have a name and n implementation. They
       all share the same "structure" (a method and a getter), but each algo has its own
       name and logic. For this reason, using 'implements' is a good idea since I don't
       want to reuse code. This example implements what's call the "Strategy pattern"

  In general, its best to use inheritance when I need to share reusable methods along the
  hierarchy. I should also prefer interfaces when there is no code to share and all types 
  must have the same structure. In other words, abstract classes are meant to SHARE
  behaviors while  interfaces DON'T
*/

class File {
  String get path => 'the path';
  bool get isAbsolute => true;
}

abstract class FileReader {
  final File file;
  const FileReader(this.file);

  String get path => file.path;
  bool get isPathAbsolute => file.isAbsolute;

  String readContents();
}

class TextReader extends FileReader {
  const TextReader(super.file);

  @override
  readContents() => 'contents of a .txt file';
}

class DocxReader extends FileReader {
  const DocxReader(super.file);

  @override
  String readContents() => 'contents of a .docx file';
}

abstract class Sorter {
  void sort();
  String get name;
}

class MergeSort implements Sorter {
  @override
  void sort() {
    /*my merge sort implementation*/
  }

  @override
  String get name => 'Merge sort';
}

class QuickSort implements Sorter{
  @override
  void sort(){/* quick sort implementation */}
  @override
  String get name=>'Quick sort';
}

