# MGEStyles
An easy way to set custom styles to any `UIResponder` from the Interface Builder.

## Summary
As an iOS developer, I feel very often frustrated with how difficult is to set consistent styles to my views in the Xcode Interface Builder. If you think in a `UILabel`, you can use the same style (font, color and size) for a set of labels in different `UIViewController`. If, some time later, the design changes you'll have to change the properties of all these labels one by one, which is a tedious work. I try to solve this issue by developing `MGEStyles`. This library, inspired by the android **styles** system, simplify this task, giving you the chance of define a totally custom styles in one single place and using it all over your project, using the Inerface Builder or by code. 

**MGEStyles** is provided in two flavours, **Default** and **Lite**. The only difference is that the default version add an inspectable attribute in the interface builder, and lite version doesn't. For more details, please go to the [applying styles section](#applying_styles)

## Installation
### Cocoapods
Add the following to your `Podfile`:

```
pod 'MGEStyles'
```

or if you prefer the **Lite** flavour:

```
pod 'MGEStyles/Lite'
```

Then run `$ pod install`.

If you don't have CocoaPods installed or integrated into your project, you can learn how to do so [here](http://cocoapods.org).

Import the library by doing `#import <MGEStyles/MGEStyles.h>`.

### Manually
Clone or donwload the project and copy the contents of the **MGEStyles** folder into your project. Then, you can remove the **Inspectable** folder if you prefer the Lite flavour.


## Usage

The library works in 3 steps:

1 - You have to create the styles you need

2 - You have to register all the stlyes that you want to use in your application. 

3 - Apply these styles in your `UIResponder` in the interface builder or with code. 

### Creating styles:
In this library, the styles are `MGEStyle` objects. Each style will have a configuration block, which will tell the library what to do with the `UIResponder`. For example, if you want to create a style for `UILabels` you would do:

````
MGEStyle * baseStyle = [MGEStyle styleWithConfigurationBlock:^(UILabel *responder) {
        responder.font = [UIFont boldSystemFontOfSize:16];
        responder.numberOfLines = 0;
    }];
````

`MGEStyles` allows inheritance. When a `MGEStyle` has a parent, the parent's configuration block is executed before the own block. That means that a child style can overwrite some behaviours of the parent block just by setting again the needed values on its own configuration block. As an example, we can create a child for the previous style with this method:

````
MGEStyle * titleStyle = [MGEStyle styleWithParent:baseStyle
                                    configuration:^(UILabel *label) {
                                              label.textColor = [UIColor redColor];
                                              label.textAlignment = NSTextAlignmentCenter;
                                          }];
````



### Registering Styles:

To register a style you have to use the a class called `MGEStylesManager`, which is a singleton. Every registered style has a key, which must be unique within the app and it is the way to identify a style. To register a style you have to call: 

````
- (void) registerStyle:(MGEStyle *) style withKey:(NSString *) key;
````

For example, if we want to register the defined **titleStyle** we'll do:

````
MGEStylesManager * manager = [MGEStylesManager sharedManager];
[manager registerStyle:childStyle withKey:@"LabelTitleStyle"];
````

The styles should be registered at application launch, so `application:didFinishLaunchingWithOptions:` might seems a good place to do it. Anyway, in order to keep the **AppDelegate** as clean as possible, creating a helper class to create and register all the styles and call this class from the AppDelegate is strongly recommended. 

<a name="applying_styles"></a>
### Applying Styles: 

The final step is to apply the styles. There is 2 ways to do it: 

#### Using Interface Builder:
When you use the **Default** flavour, a new property appears in the attribute inspector in the interface builder. It is called **Mge Style**. Here you should provide the key of the registered style you want to apply:

![](https://github.com/ManueGE/MGEStyles/blob/master/readme_imgs/mgestyles_inspector.png?raw=true)

If are using the **Lite** flavour or your version of Xcode doesn't supoort **IBInspectables** you can achieve the same result by addign a new attribute in the **User defined runtime attributes** section. The name must be **mgeStyle**, the type must be **String** and the Value must be the key of your registered style:

![](https://github.com/ManueGE/MGEStyles/blob/master/readme_imgs/mgestyles_manually.png?raw=true)

#### By Code:
`MGEStyles` provides a category which allow apply a style to any `UIResponder`. If you want to apply the "LabelTitleStyle" to a label, you can do it by typing:

````
[mge_applyRegisteredStyleWithKey:key];
````

You can also apply a no registered style:

````
MGEStyle * baseStyle = [MGEStyle styleWithConfigurationBlock:^(UIButton *button) {
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        responder.numberOfLines = 0;
    }];
    
[button mge_applyStyle:style];
```` 

## Contact  
[@ManueGE](https://twitter.com/ManueGE)

## License
MGEStyles is available under the Apache License. See [LICENSE](https://github.com/ManueGE/MGEStyles/blob/master/LICENSE).



