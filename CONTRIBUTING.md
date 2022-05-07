# Contributing to Lion

Please read these carefully these lines before contributing with your own source code to this project. 

## C++ coding guidelines

This section gives guidelines regarding the programming style for C++ code.

### General style

- A header `.h` file should include function and class declarations, and a `.hpp` file includes the implementation. 
- The `.h` file shall include the `.hpp` file, and other files only should include the `.h` file.
- Always include safeguards, named after the name of the file. E.g., for `my_class.h` use `#ifndef MY_CLASS_H__`, and `my_class.hpp` `#ifndef MY_CLASS_HPP__`
- Use 4 spaces to indent, instead of tabs. An exception can be the switch case, where the `case` statements can have a spacing of 1 space.
- Variable names should be descriptive. Never use ambiguous names such as 'aux', 'temp', or 'old'.
- Always use snake_case (https://betterprogramming.pub/string-case-styles-camel-pascal-snake-and-kebab-case-981407998841)
- Variable names must be lower case (except if it refers to a human name, e.g. Hermite, Lagrange)
- Function names must be lower case 
- File names must be lower case
- Add newlines for braces:
  ```cpp
  if (statement_is_true)
  {
    // do something...
  }
  ```
  
  instead of
  
  ```cpp
  if ( statement_is_true ) {
    // do something...
  }
  ```
- Use ```// comment``` for comments instead of ```/*  comment */```
- Add `const` statements whenever it applies.
- Avoid manual dynamic allocation of variables (i.e. avoid using `new` and `delete`). Use `std::vector` and smart pointers instead.
- Add comments in doxygen format.
 
### Classes

- Avoid polymorphism and virtual functions as long as it is possible. Use template versions instead.
- If a class is derived, save its parent as `base_type`:

  ```cpp
  class Child : public Parent
  {
    using base_type = Parent;
  };
  ```
- Do not have `const` data members, as it prevents the class from having a copy-assignment operator.
- Make `public:` only what it is truly required. The rest should default to `private:`
- Use `static` member functions if their implementation does not require an instance of the class.
- Use `const` member functions if the instance of the class is readonly in the their implementation.

### Algorithms

- Try to use C++ most recent features, within the C++ standard. C++17 is preferred.
- Before writing an algorithm, make sure it is not in the STL already (standard template library): https://www.cplusplus.com/reference/algorithm/
- If an algorithm is to be used by the laptime optimal simulator, make sure it is templatized 
