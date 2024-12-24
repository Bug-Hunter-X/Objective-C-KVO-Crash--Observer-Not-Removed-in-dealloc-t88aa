In Objective-C, a subtle bug can occur when using KVO (Key-Value Observing) with custom classes that don't properly handle the `dealloc` method. If an observer is not removed before the observed object is deallocated, it can lead to crashes or unexpected behavior.  This often manifests as EXC_BAD_ACCESS errors or strange program termination.  The issue is that the observer might try to access memory that has already been freed.