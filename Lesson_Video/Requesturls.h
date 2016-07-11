//
//  Requesturls.h
//  Lesson_Video
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#ifndef Requesturls_h
#define Requesturls_h

// data 全部主播请求 url
#define DotaAllAuchorsRequest_url @"http://api.dotaly.com/api/v1/authors?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0"

// lol 全部主播请求 url 
#define LOLAllAuchorsRequest_url @"http://api.dotaly.com/lol/api/v1/authors?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E"

// dpta 单个主播所有视频 url, 因为需要参数ID，所以用了ID。
#define DotaSingleAuthorAllVidelosRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/shipin/latest?author=%@&iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&limit=50", ID]

// lol 单个主播所有视频 url .
#define LOLSingleAuthorAllVideoRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/shipin/latest?author=%@ &iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&limit=50", ID]

// dota 视频地址
#define dotaSingleVideoAdressRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/getvideourl?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&type=mp4&vid=%@", ID]

// lol 视频地址
#define lolSingleVideoAdressRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/getvideourl?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&type=flv&vid=%@", ID]


#endif /* Requesturls_h */
