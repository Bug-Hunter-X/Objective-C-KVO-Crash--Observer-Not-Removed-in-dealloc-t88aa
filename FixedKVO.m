The solution involves ensuring that the KVO observer is always removed in the `dealloc` method of the observer class.  Here's the corrected code:

```objectivec
@interface MyObserver : NSObject
@property (nonatomic, weak) ObservedObject *observedObject;
@end

@implementation MyObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // Handle KVO notification
}

- (void)dealloc {
    [self.observedObject removeObserver:self forKeyPath:@"observedProperty"];
}
@end

```
By explicitly calling `removeObserver:forKeyPath:` within `dealloc`, we guarantee that the observer is removed before the observed object's memory is released, thus preventing the crash.