//
// Created by Casper Storm Larsen on 28/06/16.
// Copyright (c) 2016 Rise Digital. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+Random.h"

@interface HomeViewController() <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *saveImageButton;
@property (nonatomic, strong) UIImageView *latestPhotoImageView;
@end
@implementation HomeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupSubviews];
    [self defineLayout];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self generateRandomColors];
}

- (void)defineLayout {
    [self.saveImageButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.saveImageButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.saveImageButton.bottomAnchor constraintEqualToAnchor:self.cameraButton.topAnchor].active = YES;
    [self.saveImageButton.heightAnchor constraintEqualToConstant:75].active = YES;

    [self.cameraButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.cameraButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.cameraButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.cameraButton.heightAnchor constraintEqualToConstant:75].active = YES;

    [self.latestPhotoImageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:25].active = YES;
    [self.latestPhotoImageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-25].active = YES;
    [self.latestPhotoImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50].active = YES;
    [self.latestPhotoImageView.bottomAnchor constraintEqualToAnchor:self.saveImageButton.topAnchor constant:-50].active = YES;
}

- (void)setupSubviews {
    [self.view addSubview:self.cameraButton];
    [self.view addSubview:self.latestPhotoImageView];
    [self.view addSubview:self.saveImageButton];
}

- (void)generateRandomColors {
    self.cameraButton.backgroundColor = [UIColor rise_randomColor];
    self.saveImageButton.backgroundColor = [UIColor rise_randomColor];
    self.latestPhotoImageView.backgroundColor = [UIColor rise_randomColor];
    self.navigationController.navigationBar.tintColor = [UIColor rise_randomColor];
    self.view.backgroundColor = [UIColor rise_randomColor];
}

#pragma mark - Actions

- (void)didPressCameraButton:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;

    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)didPressSaveButton:(id)sender {
    if(self.latestPhotoImageView.image != nil) {
        UIImageWriteToSavedPhotosAlbum(self.latestPhotoImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
}

#pragma mark - UIImagePickerController

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.latestPhotoImageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo: (void *) contextInfo {
    if(error) {
        [self presentAlertWithTitle:@"Error" message:@"Something went wrong :("];
    } else {
        [self presentAlertWithTitle:@"Success" message:@"Image saved :)"];
    }
}

#pragma mark - Helpers

- (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert =[UIAlertController
            alertControllerWithTitle:title
                             message:message
                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction
            actionWithTitle:@"OK"
                      style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction * action) {
                        [alert dismissViewControllerAnimated:YES completion:nil];
                    }];

    [alert addAction:alertAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Properties

- (UIButton *)cameraButton {
    if (!_cameraButton) {
        _cameraButton = [UIButton new];
        [_cameraButton setTitle:@"New shot" forState:UIControlStateNormal];
        [_cameraButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_cameraButton addTarget:self action:@selector(didPressCameraButton:) forControlEvents:UIControlEventTouchUpInside];
        [_cameraButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    }
    return _cameraButton;
}

- (UIButton *)saveImageButton {
    if (!_saveImageButton) {
        _saveImageButton = [UIButton new];
        [_saveImageButton setTitle:@"Save image" forState:UIControlStateNormal];
        [_saveImageButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_saveImageButton addTarget:self action:@selector(didPressSaveButton:) forControlEvents:UIControlEventTouchUpInside];
        [_saveImageButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    }
    return _saveImageButton;
}

- (UIImageView *)latestPhotoImageView {
    if (!_latestPhotoImageView) {
        _latestPhotoImageView = [UIImageView new];
        [_latestPhotoImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _latestPhotoImageView;
}

@end