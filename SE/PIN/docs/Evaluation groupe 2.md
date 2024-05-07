### Project Management and Use of GIT

[+] Good division of the project into two subgroups, 3 people for the UI (user interface) and 2 for the setup.

[+] Proper folder separation to avoid issues in Git usage.

[+] Quick setup of the UI to quickly visualize the calculation results provided by the setup.  
### Code Implementation

[+] Comprehensive interface and effective management of time increments. Counters are reset to zero when launching a new timeline.

[+] Regarding robot movement, adept utilization of formulas, clear and concise code. Well-segmented methods with clear comments.

[+] Implementation of binary search to find the moment when robots collide.

[+] Implementation inspired by the QT examples for QTimer, demonstrating a good understanding of the examples.

[-] In the setup section, things are a bit more chaotic with fewer comments. It might have been better to split the main code into several sub-files.

- Improvement: Divide the code into coherent sub-files.

[-] Refactoring is necessary to make the particle explosion code more readable and maintainable.

- Improvement: Separate the code into simple and comprehensible functions.

[-] Mathematical functions used to determine the distance between two robots should be implemented in a single location and not duplicated.

- Improvement: Link files together to reuse methods instead of duplicating them.
### Group 2 Comment

All these negative points were treated later after the evaluation when we were developing the remaining code, but these comments will be taken into account for the rest of the project.

The algorithm dedicated to the particle explosion has been improved by adding a new layer of loops that deal with the "generation" of the particles. The same code is used to create all the particles's different generations, rather than a code for each generation.

Thanks for the time taken to evaluate our project.