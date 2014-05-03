//
//  NSString+RegexerSpec.m
//  Regexer
//
//  Created by Michaël Fortin on 2014-05-02.
//  Copyright 2014 Michaël Fortin. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "NSString+Regexer.h"
#import "RXRegexCache.h"

SPEC_BEGIN(NSString_RegexerSpec)

describe(@"NSString+Regexer", ^
{
	beforeEach(^
	{
		[[RXRegexCache sharedCache] clear];
	});
	
	context(@"asking for an NSRegularExpression", ^
	{
		it(@"should create an instance given a valid pattern", ^
		{
			NSRegularExpression *regex = [@"[a-zA-Z0-9_]{12}" rx_regex];
			[[regex should] beNonNil];
		});
		
		it(@"should throw given an invalid pattern", ^
		{
			[[theBlock(^{ [@"\\" rx_regex]; }) should] raise];
		});
	});
});

SPEC_END
