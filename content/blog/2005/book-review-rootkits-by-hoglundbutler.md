title=Book Review: Rootkits
date=2005-09-14
type=post
tags=industry, reading, review, security
status=published
description=In which I talk about the book.
~~~~~~

The title is a bit scary, but "Rootkits", by Hoglund and Butler, really is anything but. Oh, I'll admit, their talk of how rootkits--programs that hackers install onto your system that patch into kernel space and thus are undetectable by any user-mode program--is scary, but then they walk you through the process of developing your own rootkit, thereby giving you some awareness of what a rootkit looks like, acts like, and therefore can be discovered and killed.

Well, in theory, anyway.

<!--more-->

To put it bluntly, I'm *loving* this book, if only because it's the first book I've run into that really sits down and explains how to write a device driver, not to mention how to communicate with it from user mode. I've been fascinated with that very idea for many years now, but all the DDK-based material I've found--books, articles, etc--all assumed that you wanted to write some variation on the SCSI driver or something, implying that you care more about device-level details than you do in writing kernel-mode code. Rootkits, of course, are nothing like real device drivers, but a lot more like what I'm interested in exploring and displaying (that is, getting at program information from within the kernel--very useful for debugging scenarios, for example).

By page 30, you've already written and compiled a basic kernel driver, and by page 39 they've discussed how you can have your driver expose itself as a special file handle for communication with user-mode code. Pages 40-43 talk about loading the driver from code, and 43-46, how to extract your driver from a user-mode program as a resource, suitable for loading (because, of course, rootkits need to piggyback on top of other code to install themselves, stealthy-like). Pages 46-47 talk about how to make your rootkit survive reboot, and that concludes Chapter Two.

Wow. I'm in love.

It's not the be-all-end-all book on drivers, nor is it going to necessarily turn you into a l33t hax0r, but if you ever wanted to get started understanding how rootkits work (so as to start looking for them on your own system in order to remove them) or just use that knowledge for more benign purposes (such as trying to figure out NT internals so you can more efficiently--and automatedly--debug services or server-style programs), this book rocks. Easily a classic, and one I'm probably going to carry around with me as much as I do Hoglund's other book (with Gary McGraw, one of my favorite security authors), "Exploiting Software".
 