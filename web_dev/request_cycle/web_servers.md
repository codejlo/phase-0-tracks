**KEY LINUX/UNIX PHILOSOPHIES**

Small is Beautiful
- Minimize the scope of any given program

Make Each Program Do One Thing Well
- With these small programs, make them do their job extremely well

Prototype as Soon as Possible
- So you can spot opportunities for improvement early and iterate

Choose Portability Over Efficiency
- Rather than optimizing for a specific set of constraints, seek ways to increase the breadth of compatability

Store Data in Flat Text Files

Use Software Leverage
- Use the work already done by other programmers to be efficient

Use Shell Scripts to Increase Leverage and Portability

Avoid Captive User Interfaces

Make Every Program a Filter


**VIRTUAL PRIVATE SERVER**

An independent section of a physical server's memory, dedicated to a remote user running its own software.

A physical server and virtual private server are similar, but differ in:
- Speed: a virtual private server, hosting many users on one physical system, has to cater to the needs of the group, which could mean slower or at least less-optimized performance relative to a dedicated physical server, where one user could direct computing power in a more targeted way.
- Easily expandable: being software, it's very easy to create new VPS's and to configure them.
- Cost: At most organization's scales and performance needs, VPS's deliver the needed performance at lower cost than physical servers.


**ROOT = BAD**

Like a global variable in ruby, ROOT gives you access to everything on the server - the OS, the settings, programs, data...everything that the web applications sit on. User accounts confine each user to more limited domains on the system, enough so that they can write/read files necessary for building the web app, but not enough to modify the underlying settings. Then when someone with bad intent tries to access the server, they are hopefully restricted to the space of lower-level users rather than the entire server.
