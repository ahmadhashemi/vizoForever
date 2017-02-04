@interface SettingViewController

- (void)unityAdsReady:(id)arg1;
- (void)unityAdsDidFinish:(id)arg1 withFinishState:(long long)arg2;
- (void)addMore:(id)arg1;

@end

@interface ViewController

- (void)closePopup:(id)arg1;

@end

%hook SettingViewController

-(void)viewDidAppear:(BOOL)animated {

	%orig;
	[self unityAdsReady:nil]; // To immediately make add more button ready to tap.

}

- (void)addMore:(id)arg1 {

	[self unityAdsDidFinish:nil withFinishState:0]; // Call what will be called when ad finishes.

}

-(void)showResultPopup {} // Showing an alert each time is annoying. Isn't it?

%end

%hook ViewController

-(void)viewWillAppear:(BOOL)animated {

	%orig;
	[self closePopup:nil]; // show an alert EVERY TIME user opens application? oh boy :|

}

%end