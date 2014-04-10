//
//  OBMasterList.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBJsonProperties.h"
#import "OBMasterList.h"
#import "OBSectionList.h"

@interface OBMasterList()

- (NSArray *)getSection:(NSInteger)section;

@end

@implementation OBMasterList

- (void)initWithJson:(NSDictionary *)jsonAsDictionary
{
    self.items = [[NSMutableArray alloc] init];
    _sections = [[NSMutableArray alloc] init];
    
    NSDictionary *head = jsonAsDictionary[OBJsonPropertyHead];
    _title = head[OBJsonPropertyTitle];
    
    NSArray *results = jsonAsDictionary[OBJsonPropertyBody];
    
    for (NSDictionary *dict in results)
    {
        if (dict[OBJsonPropertyType])
        {
            [super addToItems:dict];
        }
        else if(dict[OBJsonPropertyChildren])
        {
            // Create section
            OBSectionList *section = [[OBSectionList alloc] init];
            [section initWithJson:dict];
            [_sections addObject:section];
        }
        // Ignore if does not have a type or contain children
    }
}

- (NSInteger)getNumberOfSections
{
    NSInteger count = 0;
    
    if (self.items.count > 0)
    {
        count++;
    }
    
    return count + _sections.count;
}

- (NSInteger)getNumberOfItemsInSection:(NSInteger)section
{
    return [self getSection:section].count;
}

- (NSString *)getTitleForSection:(NSInteger)section
{
    if (_sections.count == 0)
    {
        // No section header required
        return nil;
    }
    
    // List has it's own items
    if (self.items.count > 0)
    {
        if (section == 0)
        {
            // Empty section header for list's own items
            return @" ";
        }
        
        // List's own items are section #0
        // Sections 0th items are section #1
        section--;
    }
    
    return ((OBSectionList *)self.sections[section]).text;
}

- (id)getItemAtSection:(NSInteger)section atIndex:(NSUInteger)index
{
    return [[self getSection:section] objectAtIndex:index];
}

- (NSArray *)getSection:(NSInteger)section
{
    // List has it's own items
    if (self.items.count > 0)
    {
        if (section == 0)
        {
            return self.items;
        }
        
        // List's own items are section #0
        // Sections 0th items are section #1
        section--;
    }
    
    return ((OBSectionList *)self.sections[section]).items;
}

@end
