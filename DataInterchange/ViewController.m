//
//  ViewController.m
//  DataInterchange
//
//  Created by wanghuiyong on 08/11/2016.
//  Copyright © 2016 wanghuiyong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onParseJson:(id)sender;
{
    // 字典形式的 JSON 数据
	NSString *jsonDictionaryString = @"{\"name\":\"wanghuiyong\", \"age\":\"26\"}";
	NSData *jsonDictionaryData = [jsonDictionaryString dataUsingEncoding:NSUTF8StringEncoding];
	id jsonObject1 = [NSJSONSerialization JSONObjectWithData:jsonDictionaryData options:NSJSONReadingAllowFragments error:nil];
	if ([jsonObject1 isKindOfClass:[NSDictionary class]])
	{
		// 字典类型
		NSDictionary *dictionary = (NSDictionary *)jsonObject1;
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"1. 字典形式的 JSON 数据: \n"];
		_tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dictionary objectForKey:@"name"]];
		_tvParseResult.text = [_tvParseResult.text stringByAppendingString:@", "];
		_tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dictionary objectForKey:@"age"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
	}
    // 嵌套的树形的字典形式的 JSON 数据
    NSString *jsonTreeString = @"{\"user\":{\"name\":\"wanghuiyong\", \"age\":\"26\"}}";
    NSData *jsonTreeData = [jsonTreeString dataUsingEncoding:NSUTF8StringEncoding]; 
    id jsonObject2 = [NSJSONSerialization JSONObjectWithData:jsonTreeData options:NSJSONReadingAllowFragments error:nil];
    if ([jsonObject2 isKindOfClass:[NSDictionary class]])
    {
        // 字典类型
        NSDictionary *dictionary = (NSDictionary *)jsonObject2;
        NSDictionary *dictionary2 = [dictionary objectForKey:@"user"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"2. 嵌套的树形的字典形式的 JSON 数据: \n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dictionary2 objectForKey:@"name"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@", "];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dictionary2 objectForKey:@"age"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
    }
    // 数组形式的 JSON 数据
    NSString *jsonArrayString = @"[{\"name\":\"wanghuiyong1\"}, {\"name\":\"wanghuiyong2\"}]";
    NSData *jsonArrayData = [jsonArrayString dataUsingEncoding:NSUTF8StringEncoding]; 
    id jsonObject3 = [NSJSONSerialization JSONObjectWithData:jsonArrayData options:NSJSONReadingAllowFragments error:nil];
    if ([jsonObject3 isKindOfClass:[NSArray class]])
 	{
 		// 数组类型(数组元素是字典)
         _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"3. 字典元素的数组形式的 JSON 数据: \n"];
        NSArray *array = (NSArray *)jsonObject3;
        for (NSDictionary *dictionary in array)
        {
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dictionary objectForKey:@"name"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@", "];
        }
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
 	}
    // 字典和数组组合形式的 JSON 数据
    NSString *jsonTreeArrayString = @"{\"user\":[{\"name\":\"wanghuiyong1\"}, {\"name\":\"wanghuiyong2\"}]}";
    NSData *jsonTreeArrayData = [jsonTreeArrayString dataUsingEncoding:NSUTF8StringEncoding]; 
    id jsonObject4 = [NSJSONSerialization JSONObjectWithData:jsonTreeArrayData options:NSJSONReadingAllowFragments error:nil];
    if ([jsonObject4 isKindOfClass:[NSDictionary class]])
    {
        // 字典类型(值是数组)
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"4. 字典和数组形式的 JSON 数据: \n"];
        NSDictionary *dictionary = (NSDictionary *)jsonObject4;
        NSArray *array = [dictionary objectForKey:@"user"];
        for (NSDictionary *dictionary in array)
        {
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dictionary objectForKey:@"name"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@", "];
        }
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
    }
    // 读取 JSON 文件
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"weatherinfo" ofType:@"json"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:jsonFilePath])
    {
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"5. JSON 文件路径: \n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:jsonFilePath];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
        NSString *jsonString = [NSString stringWithContentsOfFile:jsonFilePath encoding:NSUTF8StringEncoding error:nil];
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
        if ([jsonObject isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *dictionary = (NSDictionary *)jsonObject;
            NSDictionary *dictionaryValue = [dictionary objectForKey:@"weatherinfo"];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"6. 解析 JSON 本地文件内容:\n"];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dictionaryValue objectForKey:@"city"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@", "];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dictionaryValue objectForKey:@"temp1"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@", "];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dictionaryValue objectForKey:@"temp2"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@", "];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dictionaryValue objectForKey:@"weather"]];
        }
    }
    // 读取网络文件
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n7. 解析 JSON 网络文件内容:\n"];
    NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101010100.html"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLRequest *request = [[NSURLRequest alloc] init];
    jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog(@"jsonData = %@", jsonString);
//    _tvParseResult.text = [_tvParseResult.text stringByAppendingString:jsonString];
//    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}
@end







