// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

public type ChannelArr Channel[];

public type GroupArr Group[];

public type VideoArr Video[];

public type CategoryArr Category[];

public type UserArr User[];

public type TagArr Tag[];

public type CommentArr Comment[];

public type CreditArr Credit[];

public type PictureArr Picture[];

public type TextTrackArr TextTrack[];

public type ContentRatingArr ContentRating[];

public type CreativeCommonsArr CreativeCommons[];

public type LanguageArr Language[];

public type AlbumArr Album[];

public type Activity31Arr Activity31[];

public type PortfolioArr Portfolio[];

public type ProjectArr Project[];

public type DomainArr Domain[];

# Information about the user's usage for the current period.
public type UserUploadQuotaPeriodic record {
    # The number of bytes remaining in your upload quota for the current period.
    decimal? free;
    # The total number of bytes that you can upload per period.
    decimal? max;
    # The time in ISO 8601 format when your upload quota resets.
    string? reset_date;
    # The number of bytes that you've already uploaded against your quota in the current period.
    decimal? used;
};

public type UserWebsites record {
    # The website's description.
    string? description;
    # The URL of the website.
    string link;
    # The name of the website.
    string? name;
};

public type MevideosPrivacy record {
    # Whether a user can add the video to an album, channel, or group.
    boolean add?;
    # The privacy level required to comment on the video.
    string comments?;
    # Whether a user can download the video. Not available to users with a Basic membership
    boolean download?;
    # The video's embed settings. The `whitelist` value enables you to define all valid embed domains. See our [documentation](https://developer.vimeo.com/api/endpoints/videos#/{video_id}/privacy/domains) for details on adding and removing domains.
    string embed?;
    # The video's privacy setting. When privacy is `users`, `application/json` is the only valid content type. Basic users can't set privacy to `unlisted`.
    string view?;
};

# A list of resource URIs related to the video.
public type VideoMetadataConnections record {
    # Information about the comments on this video.
    VideoMetadataConnectionsComments comments;
    # Information about the users credited in this video.
    VideoMetadataConnectionsCredits credits;
    # Information about the users who have liked this video.
    VideoMetadataConnectionsLikes likes;
    # Information about this video's ondemand data.
    VideoMetadataConnectionsOndemand ondemand;
    # Information about this video's thumbnails.
    VideoMetadataConnectionsPictures pictures;
    # The DRM playback status connection for this video.
    VideoMetadataConnectionsPlayback playback;
    # The recommendations for this video.
    VideoMetadataConnectionsRecommendations recommendations;
    # Related content for this video.
    VideoMetadataConnectionsRelated related;
    # Information about the video's season.
    VideoMetadataConnectionsSeason season;
    # Information about this video's text tracks.
    VideoMetadataConnectionsTexttracks texttracks;
    # Information about this video's VOD trailer.
    VideoMetadataConnectionsTrailer trailer;
    # Information about the user privacy of this video, if the video privacy is `users`.
    VideoMetadataConnectionsUsersWithAccess users_with_access;
    # Information about the versions of this video.
    VideoMetadataConnectionsVersions versions;
};

# The video version's metadata.
public type VideoversionsMetadata record {
    VideoversionsMetadataConnections connections;
};

public type PlayProgressive record {
    # The time in ISO 8601 format when this video file was created.
    string created_time;
    # The FPS of the video file.
    decimal fps;
    # The height in pixels of the video.
    decimal? height;
    # The direct link to this video file.
    string link;
    # The time in ISO 8601 format when the link to this video file expires.
    string link_expiration_time;
    # The URLs for logging events.
    record {} log?;
    # The MD5 hash of the video file.
    string md5;
    # The file size in bytes of this video.
    decimal? size;
    # The type of the video file:
    # 
    # Option descriptions:
    #  * `source` - The video is a source file.
    #  * `video/mp4` - The video is in MP4 format.
    #  * `video/webm` - The video is in WebM format.
    #  * `vp6/x-video` - The video is in VP6 format.
    string? 'type;
    # The width in pixels of the video.
    decimal? width;
};

# The group's privacy settings.
public type GroupPrivacy record {
    # Who can comment on the group:
    # 
    # Option descriptions:
    #  * `all` - Anyone can comment on the group.
    #  * `members` - Only members can comment on the group.
    string comment;
    # Who can invite new members to the group:
    # 
    # Option descriptions:
    #  * `all` - Anyone can invite new members to join.
    #  * `members` - Only group members can invite new members to join.
    string invite;
    # Who can join the group:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can join the group.
    #  * `members` - Only people with a Vimeo account can join the group.
    string 'join;
    # Who can add videos to the group:
    # 
    # Option descriptions:
    #  * `all` - Anyone can add videos to the group.
    #  * `members` - Only group members can add videos to the group.
    string videos;
    # Who can view the group:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the group.
    #  * `members` - Only group members can view the group.
    string view;
};

public type PictureSizes record {
    # The height of the image.
    decimal? height;
    # The direct link to the image.
    string link;
    # The direct link to the image with a play button overlay.
    string link_with_play_button?;
    # The width of the image.
    decimal width;
};

# User actions that have involved the group. This data requires a bearer token with the `private` scope.
public type GroupMetadataInteractions record {
    # An action indicating that someone has joined the group. This data requires a bearer token with the `private` scope.
    GroupMetadataInteractionsJoin 'join;
};

public type Endpoint record {
    # All HTTP methods permitted on this endpoint.
    string[] methods;
    # The path section of the URL, which, when appended to the API host `https:///api.vimeo.com`, builds a full API endpoint.
    string path;
};

public type Picture record {
    # Whether this picture is the active picture for its parent resource.
    boolean active;
    # The upload URL for the picture. This field appears when you create the picture resource for the first time.
    string link?;
    # The picture's resource key string.
    string resource_key;
    # An array containing reference information about all available image files.
    PictureSizes[] sizes;
    # The type of the picture:
    # 
    # Option descriptions:
    #  * `caution` - An image that is appropriate for all ages.
    #  * `custom` - A custom image for the video.
    #  * `default` - The default image for the video.
    string 'type;
    # The picture's URI.
    string uri;
};

# The list of resource URIs related to the user.
public type UserMetadataConnections record {
    # Information about the albums created by this user.
    UserMetadataConnectionsAlbums albums;
    # Information about the appearances of this user in other videos.
    UserMetadataConnectionsAppearances appearances;
    # Information on the users that the current user has blocked. This data requires a bearer token with the `private` scope.
    UserMetadataConnectionsBlock block;
    # Information about this user's followed categories.
    UserMetadataConnectionsCategories categories;
    # Information about this user's subscribed channels.
    UserMetadataConnectionsChannels channels;
    # Information about this user's feed.
    UserMetadataConnectionsFeed feed;
    # Information about this user's folders.
    UserMetadataConnectionsFolders folders;
    # Information about the user's followers.
    UserMetadataConnectionsFollowers followers;
    # Information about the users that the current user is following.
    UserMetadataConnectionsFollowing following;
    # Information about the groups created by this user.
    UserMetadataConnectionsGroups groups;
    # Information about the videos that this user has liked.
    UserMetadataConnectionsLikes likes;
    # Information about the channels that this user moderates.
    UserMetadataConnectionsModeratedChannels moderated_channels;
    # Information about this user's portraits.
    UserMetadataConnectionsPictures pictures;
    # Information about this user's portfolios.
    UserMetadataConnectionsPortfolios portfolios;
    # A collection of recommended channels for the current user to follow. This data requires a bearer token with the `private` scope.
    UserMetadataConnectionsRecommendedChannels recommended_channels;
    # A Collection of recommended users for the current user to follow. This data requires a bearer token with the `private` scope.
    UserMetadataConnectionsRecommendedUsers recommended_users;
    # Information about the videos that have been shared with this user.
    UserMetadataConnectionsShared shared;
    # Information about the videos uploaded by this user.
    UserMetadataConnectionsVideos videos;
    # Information about the videos that this user has watched.
    UserMetadataConnectionsWatchedVideos watched_videos;
    # Information about the videos that this user wants to watch later.
    UserMetadataConnectionsWatchlater watchlater;
};

# A list of resource URIs related to the album.
public type PortfolioMetadataConnections record {
    # Information about the videos contained within this portfolio.
    PortfolioMetadataConnectionsVideos videos;
};

# Information about the channels related to this category.
public type CategoryMetadataConnectionsChannels record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of channels on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# A list of resource URIs related to the channel.
public type ChannelMetadataInteractions record {
    # An action indicating that the authenticated user is the owner of the channel and may therefore add other users as channel moderators. This data requires a bearer token with the `private` scope.
    ChannelMetadataInteractionsAddModerators add_moderators;
    # When a channel appears in the context of adding or removing a video from it (`/videos/{video_id}/available_channels`), include information about adding or removing the video. This data requires a bearer token with the `private` scope.
    ChannelMetadataInteractionsAddTo add_to;
    # An action indicating if the authenticated user has followed this channel. This data requires a bearer token with the `private` scope.
    ChannelMetadataInteractionsFollow follow;
    # An action indicating that the authenticated user is a moderator of the channel and may therefore add or remove videos from the channel. This data requires a bearer token with the `private` scope.
    ChannelMetadataInteractionsModerateVideos moderate_videos;
};

public type MevideosEmbedLogosCustom record {
    # Show or hide your custom logo.
    boolean active?;
    # The URL that loads when the user clicks your custom logo.
    string link?;
    # Whether always to show the custom logo or to hide it after time with the rest of the UI.
    boolean sticky?;
};

# Subscription information for an On Demand video.
public type VideoMetadataInteractionsSubscribe record {
    # Whether the video has DRM.
    boolean drm?;
    # The time in ISO 8601 format when the subscription expires.
    string expires_time?;
    # The tine in ISO 8601 format when the subscription was purchased.
    string purchase_time?;
    # The stream type.
    string 'stream?;
};

# Information about the albums created by this user.
public type UserMetadataConnectionsAlbums record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of albums on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# A list of resource URIs related to the activity.
public type Activity31MetadataConnections record {
    # Related content for this activity.
    Activity31MetadataConnectionsRelated related;
};

# Information about this user's subscribed channels.
public type UserMetadataConnectionsChannels record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of channels on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the groups related to this category.
public type CategoryMetadataConnectionsGroups record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of groups on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the video's season.
public type VideoMetadataConnectionsSeason record {
    # The name of this season.
    string name;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Project record {
    # The time in ISO 8601 format when the project was created.
    string created_time;
    # The project's metadata.
    ProjectMetadata metadata;
    # The time in ISO 8601 format when the project was last modified.
    string modified_time;
    # The name of the folder.
    string name;
    # The resource key string of the project.
    string resource_key;
    # The URI of the project.
    string uri;
    # The owner of the project.
    record {*User;} user;
};

public type MevideosRatingsMpaa record {
    # The reason for the video's MPAA rating.
    # 
    # Option descriptions:
    #  * `at` - Adult themes
    #  * `bn` - Brief nudity
    #  * `n` - Nudity
    #  * `sl` - Strong language
    #  * `ss` - Sexual situations
    #  * `v` - Violence
    string reason?;
};

public type ContentRating record {
    # The code that uniquely identifies this content rating:
    # 
    # Option descriptions:
    #  * `drugs` - Drug or alcohol use.
    #  * `language` - Profanity or sexually suggestive content.
    #  * `nudity` - Nudity.
    #  * `safe` - Suitable for all audiences.
    #  * `unrated` - No rating.
    #  * `violence` - Violent or graphic content.
    string code;
    # The description of this content rating.
    string name;
    # The canonical relative URI of the content rating.
    string? uri;
};

public type Group record {
    # The time in ISO 8601 format when the group was created.
    string created_time;
    # The group's description.
    string? description;
    # The link to the group.
    string link;
    # Metadata about the group.
    GroupMetadata metadata;
    # The time in ISO 8601 format when the group was last modified.
    string modified_time;
    # The group's display name.
    string name;
    # The active picture for this group.
    record {*Picture;} pictures;
    # The group's privacy settings.
    GroupPrivacy privacy;
    # The resource key of the group.
    string resource_key;
    # The canonical relative URI of this group.
    string uri;
    # The owner of the group.
    record {*User;} user?;
};

# A list of resource URIs related to the video.
public type VideoMetadataInteractions record {
    # The Buy interaction for a On Demand video.
    VideoMetadataInteractionsBuy buy;
    # When a video is referenced by a channel URI, if the user is a moderator of the channel, include information about removing the video from the channel.
    VideoMetadataInteractionsChannel 'channel;
    # Information about whether the authenticated user has liked this video.
    VideoMetadataInteractionsLike like;
    # The Rent interaction for an On Demand video.
    VideoMetadataInteractionsRent rent;
    # Information about where and how to report a video.
    VideoMetadataInteractionsReport report;
    # Subscription information for an On Demand video.
    VideoMetadataInteractionsSubscribe subscribe?;
    # Information about removing this video from the user's list of watched videos.
    VideoMetadataInteractionsWatched watched;
    # Information about whether this video appears on the authenticated user's Watch Later list.
    VideoMetadataInteractionsWatchlater watchlater;
};

# Information about this video's VOD trailer.
public type VideoMetadataConnectionsTrailer record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The trailer connection resource key.
    string resource_key;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about whether this video appears on the authenticated user's Watch Later list.
public type VideoMetadataInteractionsWatchlater record {
    # Whether the user has added the video to their Watch later list.
    boolean added;
    # The time in ISO 8601 format when the user added the video to their Watch Later list.
    string added_time;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

# The video's metadata.
public type VideoMetadata record {
    # A list of resource URIs related to the video.
    VideoMetadataConnections connections;
    # A list of resource URIs related to the video.
    VideoMetadataInteractions interactions;
};

# Information about the user's followers.
public type UserMetadataConnectionsFollowers record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of followers on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the user privacy of this video, if the video privacy is `users`.
public type VideoMetadataConnectionsUsersWithAccess record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating that the authenticated user is an admin of the album and may therefore add videos. This data requires a bearer token with the `private` scope.
public type AlbumMetadataInteractionsAddVideos record {
    # An array of HTTP methods allowed on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# A standard connection object indicating how to get all the videos in this project.
public type ProjectMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information related to the block status of this user.
public type UserMetadataInteractionsBlock record {
    # Whether a user is blocking the current user.
    boolean added;
    # The time in ISO 8601 format when the block occurred, or the null value if no block exists.
    string? added_time;
    # An array of the HTTP methods permitted on this URI.
    string[] options;
    # The URI to block or unblock the user.
    string uri;
};

# Information provided to channel moderators about which users they have specifically permitted to access a private channel. This data requires a bearer token with the `private` scope.
public type ChannelMetadataConnectionsPrivacyUsers record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The total number of users on this connection. This data requires a bearer token with the `private` scope.
    decimal total;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about this user's folders.
public type UserMetadataConnectionsFolders record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of folders on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The DRM playback status connection for this video.
public type VideoMetadataConnectionsPlayback record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type VideoSpatialDirectorTimeline record {
    # The director timeline pitch, from -90 (minimum) to 90 (maximum).
    decimal pitch?;
    # The director timeline roll.
    decimal roll?;
    # The director timeline time code.
    decimal time_code?;
    # The director timeline yaw, from 0 (minimum) to 360 (maximum).
    decimal yaw?;
};

public type ApiApp record {
    # The name of the API app.
    string name;
    # The canonical URI of the API app.
    string uri;
};

# Metadata about the channel.
public type ChannelMetadata record {
    # A collection of information that is connected to this resource.
    ChannelMetadataConnections connections;
    # A list of resource URIs related to the channel.
    ChannelMetadataInteractions interactions;
};

# When a channel appears in the context of adding or removing a video from it (`/videos/{video_id}/available_channels`), include information about adding or removing the video. This data requires a bearer token with the `private` scope.
public type ChannelMetadataInteractionsAddTo record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# A collection of information about the buttons that appear on the interface of the embeddable player.
public type EmbedsettingsButtons record {
    # Whether the Embed button appears in the embeddable player for this video.
    boolean embed;
    # Whether the Fullscreen button appears in the embeddable player for this video.
    boolean fullscreen;
    # Whether the HD button appears in the embeddable player for this video.
    boolean hd;
    # Whether the Like button appears in the embeddable player for this video.
    boolean like;
    # Whether the Scaling button appears in the embeddable player for this video.
    boolean scaling;
    # Whether the Share button appears in the embeddable player for this video.
    boolean share;
    # Whether the Watch Later button appears in the embeddable player for this video.
    boolean watchlater;
};

# Information about the groups created by this user.
public type UserMetadataConnectionsGroups record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of groups on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The container of this category's parent category, if the current category is a subcategory.
public type CategoryParent record {
    # The URL to access the parent category in a browser.
    string link;
    # The display name that identifies the parent category.
    string name;
    # The unique identifier to access the parent of this category resource.
    string uri;
};

# When a video is referenced by a channel URI, if the user is a moderator of the channel, include information about removing the video from the channel.
public type VideoMetadataInteractionsChannel record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

# A collection of information relating to custom logos in the embeddable player.
public type EmbedsettingsLogosCustom record {
    # Whether the custom logo appears in the embeddable player.
    boolean active;
    # The URL that loads upon clicking the custom logo.
    string link;
    # Whether the custom logo appears even when the player interface is hidden.
    boolean sticky;
};

# Information about the members or moderators of this group.
public type GroupMetadataConnectionsUsers record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about this video's text tracks.
public type VideoMetadataConnectionsTexttracks record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of text tracks on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating if the authenticated user has followed this channel. This data requires a bearer token with the `private` scope.
public type ChannelMetadataInteractionsFollow record {
    # Whether the authenticated user has followed this channel. This data requires a bearer token with the `private` scope.
    boolean added;
    # The time in ISO 8601 format that the user followed this channel, or the null value if the user hasn't followed the channel. This data requires a bearer token with the `private` scope.
    string? added_time;
    # Whether the authenticated user is a moderator or subscriber. This data requires a bearer token with the `private` scope.
    # 
    # Option descriptions:
    #  * `moderator` - The authenticated user is a moderator.
    #  * `subscriber` - The authenticated user is a subscriber.
    string? 'type;
    # The URI for following or unfollowing this channel. PUT to this URI to follow the channel, or DELETE to this URI to unfollow the channel. This data requires a bearer token with the `private` scope.
    string uri;
};

public type UserPreferencesVideosPrivacy record {
    # Whether other users can add the user's videos.
    boolean add?;
    # The user's privacy preference for comments:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can comment on the user's videos.
    #  * `contacts` - Only contacts can comment on the user's videos.
    #  * `nobody` - No one can comment on the user's videos.
    string comments?;
    # Whether other users can download the user's videos.
    boolean download?;
    # The user's privacy preference for embeds:
    # 
    # Option descriptions:
    #  * `private` - Only the user can embed their own videos.
    #  * `public` - Anyone can embed the user's videos.
    #  * `whitelist` - Only those on the whitelist can embed the user's videos.
    string embed?;
    # The user's privacy preference for views:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the user's videos.
    #  * `contacts` - Only contacts can view the user's videos.
    #  * `disable` - Views are disabled for the user's videos.
    #  * `nobody` - No one except the user can view the user's videos.
    #  * `password` - Only those with the password can view the user's videos.
    #  * `unlisted` - Anybody can view the user's videos if they have a link.
    #  * `users` - Only other Vimeo members can view the user's videos.
    string view?;
};

public type Video record {
    # The categories to which this video belongs.
    Category[] categories;
    # The content ratings of this video.
    string[] content_rating;
    # The context of the video's subscription, if this video is part of a subscription.
    VideoContext context;
    # The time in ISO 8601 format when the video was created.
    string created_time;
    # A brief explanation of the video's content.
    string? description;
    # The video's duration in seconds.
    decimal duration;
    # Information about embedding this video.
    record {*EmbedSettings;} embed;
    # The video's height in pixels.
    decimal height;
    # The video's primary language.
    string? language;
    # The time in ISO 8601 format when the user last modified the video.
    string? last_user_action_event_date?;
    # The [Creative Commons](http://creativecommons.org/licenses/) license used for the video:
    # 
    # Option descriptions:
    #  * `by` - Attribution
    #  * `by-nc` - Attribution Non-Commercial
    #  * `by-nc-nd` - Attribution Non-Commercial No Derivatives
    #  * `by-nc-sa` - Attribution Non-Commercial Share Alike
    #  * `by-nd` - Attribution No Derivatives
    #  * `by-sa` - Attribution Share Alike
    #  * `cc0` - Public Domain Dedication
    string license;
    # The link to the video.
    string link;
    # The video's metadata.
    VideoMetadata metadata;
    # The time in ISO 8601 format when the video metadata was last modified.
    string modified_time;
    # The video's title.
    string name;
    # Information about the folder that contains this video.
    record {*Project;} parent_folder?;
    # The privacy-enabled password to watch this video. Only users can see their own video passwords. This data requires a bearer token with the `private` scope.
    string password?;
    # The active picture for this video.
    record {*Picture;} pictures;
    # The video's privacy setting.
    VideoPrivacy privacy;
    # The time in ISO 8601 format when the video was released.
    string release_time;
    # The resource key string of the video.
    string resource_key;
    # 360 spatial data.
    VideoSpatial spatial;
    # A collection of stats associated with this video.
    VideoStats stats;
    # The status code for the availability of the video. This field is deprecated in favor of `upload` and `transcode`.
    # 
    # Option descriptions:
    #  * `available` - The video is available.
    #  * `quota_exceeded` - The user's quota is exceeded with this video.
    #  * `total_cap_exceeded` - The user has exceeded their total cap with this video.
    #  * `transcode_starting` - Transcoding is beginning for the video.
    #  * `transcoding` - Transcoding is underway for the video.
    #  * `transcoding_error` - There was an error in transcoding the video.
    #  * `unavailable` - The video is unavailable.
    #  * `uploading` - The video is being uploaded.
    #  * `uploading_error` - There was an error in uploading the video.
    string? status;
    # An array of all tags assigned to this video.
    Tag[] tags;
    # The transcode information for a video upload.
    VideoTranscode transcode;
    # The upload information for this video.
    VideoUpload upload;
    # The video's canonical relative URI.
    string uri;
    # The video owner.
    record {*User;} user;
    # The video's width in pixels.
    decimal width;
};

public type Domain record {
    # Whether to permit HD embeds on this domain.
    boolean allow_hd;
    # The domain name.
    string domain;
    # The URI of the domain.
    string uri;
};

# A collection of stats associated with this video.
public type VideoStats record {
    # The current total number of times that the video has been played.
    decimal? plays;
};

# Information on the users that the current user has blocked. This data requires a bearer token with the `private` scope.
public type UserMetadataConnectionsBlock record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The total number of blocked users on this connection. This data requires a bearer token with the `private` scope.
    decimal total;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about the users credited in this video.
public type VideoMetadataConnectionsCredits record {
    # An array of HTTP methods permitted on this URI.
    string[] options?;
    # The total number of users on this connection.
    decimal total?;
    # The API URI that resolves to the connection data.
    string uri?;
};

public type MevideosEmbedLogos record {
    MevideosEmbedLogosCustom custom?;
    # Show or hide the Vimeo logo.
    boolean vimeo?;
};

# A collection of information relating to the embeddable player's title bar.
public type EmbedsettingsTitle record {
    # How the embeddable player handles the video title:
    # 
    # Option descriptions:
    #  * `hide` - The title is hidden.
    #  * `show` - The title is shown.
    string name;
    # How the embeddable player handles the video owner's information:
    # 
    # Option descriptions:
    #  * `hide` - The owner's information is hidden.
    #  * `show` - The owner's information is shown.
    string owner;
    # How the embeddable player handles the video owner's portrait:
    # 
    # Option descriptions:
    #  * `hide` - The owner's portrait is hidden
    #  * `show` - The owner's portrait is shown.
    string portrait;
};

# Information about this video's thumbnails.
public type VideoMetadataConnectionsPictures record {
    # An array of HTTP methods allowed on this URI.
    string[] options;
    # Total number of thumbnails on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Language record {
    # The code that represents this language.
    string code;
    # The name of the language.
    string name;
};

# The upload information for this version.
public type VideoversionsUpload record {
    # The approach for uploading the video.
    string approach?;
    # The URI for completing the upload.
    string complete_uri?;
    # The HTML form for uploading a video through the post approach.
    string form?;
    # The link of the video to capture through the pull approach.
    string link?;
    # The redirect URL for the upload app.
    string redirect_url?;
    # The file size in bytes of the uploaded video.
    decimal size?;
    # The status code for the availability of the uploaded video:
    # 
    # Option descriptions:
    #  * `complete` - The upload is complete.
    #  * `error` - The upload ended with an error.
    #  * `in_progress` - The upload is underway.
    string status;
    # The link for sending video file data.
    string upload_link?;
};

# Related content for this activity.
public type Activity31MetadataConnectionsRelated record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the videos related to this tag.
public type TagMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type VideoversionsMetadataConnections record {
    # Data from video associated with version
    VideoversionsMetadataConnectionsVideo video;
};

# Information about this user's portfolios.
public type UserMetadataConnectionsPortfolios record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of portfolios on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MevideosSpatial record {
    # The 360 director timeline.
    MevideosSpatialDirectorTimeline[] director_timeline?;
    # The 360 field of view: default 50, minimum 30, maximum 90.
    decimal field_of_view?;
    # The 360 spatial projection.
    string projection?;
    # The 360 spatial stereo format.
    string stereo_format?;
};

# A collection of recommended channels for the current user to follow. This data requires a bearer token with the `private` scope.
public type UserMetadataConnectionsRecommendedChannels record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The total number of channels on this connection. This data requires a bearer token with the `private` scope.
    decimal total;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# The video's privacy setting.
public type VideoPrivacy record {
    # Whether the video can be added to collections.
    boolean add;
    # Who can comment on the video:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can comment on the video.
    #  * `contacts` - Only contacts can comment on the video.
    #  * `nobody` - No one can comment on the video.
    string comments;
    # The video's download permission setting.
    boolean download;
    # The video's embed permission setting:
    # 
    # Option descriptions:
    #  * `private` - The video is private.
    #  * `public` - Anyone can embed the video.
    string embed;
    # The general privacy setting for the video:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the video.
    #  * `contacts` - Only contacts can view the video.
    #  * `disable` - Hide from vimeo
    #  * `nobody` - No one besides the owner can view the video.
    #  * `password` - Anyone with the video's password can view the video.
    #  * `unlisted` - Not searchable from vimeo.com
    #  * `users` - Only people with a Vimeo account can view the video.
    string view;
};

# Information about the user's upload space remaining for the current period.
public type UserUploadQuotaSpace record {
    # The number of bytes remaining in your upload quota.
    decimal free;
    # The maximum number of bytes allotted to your upload quota.
    decimal? max;
    # Whether the values of the upload_quota.space fields are for the lifetime quota or the periodic quota.
    string showing;
    # The number of bytes that you've already uploaded against your quota.
    decimal used;
};

# Information about the channels that this user moderates.
public type UserMetadataConnectionsModeratedChannels record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of channels on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MevideosRatings record {
    MevideosRatingsMpaa mpaa?;
    MevideosRatingsTv tv?;
};

# The upload information for this video.
public type VideoUpload record {
    # The approach for uploading the video.
    string approach?;
    # The URI for completing the upload.
    string complete_uri?;
    # The HTML form for uploading a video through the post approach.
    string form?;
    # The link of the video to capture through the pull approach.
    string link?;
    # The redirect URL for the upload app.
    string redirect_url?;
    # The file size in bytes of the uploaded video.
    decimal size?;
    # The status code for the availability of the uploaded video:
    # 
    # Option descriptions:
    #  * `complete` - The upload is complete.
    #  * `error` - The upload ended with an error.
    #  * `in_progress` - The upload is underway.
    string status;
    # The link for sending video file data.
    string upload_link?;
};

public type TextTrack record {
    # Whether this text track is active.
    boolean active;
    # The read-only URL of the text track file, intended for use with HLS playback.
    string hls_link;
    # The time in ISO 8601 format when the read-only HLS playback text track file expires.
    string hls_link_expires_time;
    # The language code for this text track. To see a full list, request
    # `/languages?filter=texttrack`.
    string? language;
    # The read-only URL of the text track file. You can upload to this link when you create it for the first time.
    string link;
    # The time in ISO 8601 format when the text track link expires.
    string link_expires_time;
    # The descriptive name of this text track.
    string? name;
    # The type of the text track:
    # 
    # Option descriptions:
    #  * `captions` - The text track is for captions.
    #  * `subtitles` - The text track is for subtitles.
    string? 'type;
    # The relative URI of the text track.
    string uri;
};

public type MevideosEmbed record {
    MevideosEmbedButtons buttons?;
    # The main color of the embed player.
    string color?;
    MevideosEmbedLogos logos?;
    # Show or hide the playbar.
    boolean playbar?;
    MevideosEmbedTitle title?;
    # Show or hide the volume selector.
    boolean volume?;
};

public type UploadAttempt record {
    # The video to upload.
    record {*Video;} clip?;
    # The completion URI of the upload.
    string complete_uri?;
    # The HTML upload form.
    string form?;
    # The ticket identifier string for the upload.
    string ticket_id;
    # The upload URL.
    string upload_link;
    # The upload URI.
    string uri;
    # The owner of the uploaded video.
    record {*User;} user;
};

public type Body56 record {
    # The email address of the credited person.
    string email;
    # The name of the credited person.
    string name;
    # The role of the credited person.
    string role;
    # The URI of the Vimeo user who should be given credit in this video.
    string user_uri;
};

# The Buy interaction for a On Demand video.
public type VideoMetadataInteractionsBuy record {
    # The currency code for the current user's region.
    string? currency;
    # Formatted price to display to buy an On Demand video.
    string? display_price;
    # The user's download access to this On Demand video:
    # 
    # Option descriptions:
    #  * `available` - The video is available for download.
    #  * `purchased` - The user has purchased the video.
    #  * `restricted` - The user isn't permitted to download the video.
    #  * `unavailable` - The video isn't available for download.
    string download;
    # Whether the video has DRM.
    boolean drm;
    # The URL to buy the On Demand video on Vimeo.
    string? link;
    # The numeric value of the price for buying the On Demand video.
    decimal? price;
    # The time in ISO 8601 format when the On Demand video was purchased.
    string? purchase_time;
    # The user's streaming access to this On Demand video:
    # 
    # Option descriptions:
    #  * `available` - The video is available for streaming.
    #  * `purchased` - The user has purchased the video.
    #  * `restricted` - The user isn't permitted to stream the video.
    #  * `unavailable` - The video isn't available for streaming
    string 'stream;
    # The product URI to purchase the On Demand video.
    string? uri;
};

public type Body55 record {
    # The reply to the comment.
    string text;
};

# Information about the videos contained within this portfolio.
public type PortfolioMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information related to the followed status of this user.
public type UserMetadataInteractionsFollow record {
    # Whether a user is following the current user.
    boolean added;
    # An array of the HTTP methods permitted on this URI.
    string[] options;
    # The URI to follow the user.
    string uri;
};

# The user's metadata.
public type UserMetadata record {
    # The list of resource URIs related to the user.
    UserMetadataConnections connections;
    UserMetadataInteractions interactions;
};

public type Body54 record {
    # The next text of the comment.
    string text;
};

public type Body53 record {
    # The text of the comment.
    string text;
};

public type Body59 record {
    # Whether this thumbnail is the default.
    boolean active?;
};

public type Body58 record {
    # Whether the image created by the `time` field should be the default thumbnail for the video.
    boolean active?;
    # Creates an image of the video from the given time offset.
    decimal time?;
};

# Information about removing this video from the user's list of watched videos.
public type VideoMetadataInteractionsWatched record {
    # Whether the user has watched the video.
    boolean added;
    # The time in ISO 8601 format when the user watched the video.
    string added_time;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MevideosUpload record {
    # The upload approach.
    string approach;
    # The public URL at which the video is hosted. The URL must be valid for at least 24 hours. Use this parameter when `approach` is `pull`.
    string link?;
    # The app's redirect URL. Use this parameter when `approach` is `post`.
    string redirect_url?;
    # The size in bytes of the video to upload.
    string size?;
};

public type Body57 record {
    # The name of the person being credited.
    string name?;
    # The role of the person being credited.
    string role?;
};

public type Body63 record {
    # The name of the version
    string file_name;
    VideosvideoIdversionsUpload upload;
};

public type Body62 record {
    # Whether the text track is active, meaning that it appears in the player. Only one text track per language, and type, can be active.
    boolean active?;
    # The language of the text track. For a full list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string language?;
    # The name of the text track.
    string name?;
    # The text track type.
    string 'type?;
};

public type Body61 record {
    # Active text tracks appear in the player and are visible to other users. Only one text track per language can be active.
    boolean active?;
    # The language of the text track. For a complete list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string language;
    # The name of the text track.
    string name;
    # The type of the text track.
    string 'type;
};

# Information about this comment's replies.
public type CommentMetadataConnectionsReplies record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of replies on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The project's metadata.
public type ProjectMetadata record {
    # A list of resource URIs related to the project.
    ProjectMetadataConnections connections;
};

public type Body60 record {
    # The name of the tag to apply. See our documentation on [batch requests](https://developer.vimeo.com/api/common-formats#batch-requests) for more information.
    string name;
    # The page number of the results to show.
    decimal page?;
    # The number of items to show on each page of results, up to a maximum of 100.
    decimal per_page?;
};

# Information about this user's feed.
public type UserMetadataConnectionsFeed record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

# The Rent interaction for an On Demand video.
public type VideoMetadataInteractionsRent record {
    # The currency code for the current user's region.
    string? currency;
    # Formatted price to display to rent an On Demand video.
    string? display_price;
    # Whether the video has DRM.
    boolean drm;
    # The time in ISO 8601 format when the rental period for the video expires.
    string? expires_time;
    # The URL to rent the On Demand video on Vimeo.
    string? link;
    # The numeric value of the price for buying the On Demand video.
    decimal? price;
    # The time in ISO 8601 format when the On Demand video was rented.
    string? purchase_time;
    # The user's streaming access to this On Demand video:
    # 
    # Option descriptions:
    #  * `available` - The video is available for streaming.
    #  * `purchased` - The user has purchased the video.
    #  * `restricted` - The user isn't permitted to stream the video.
    #  * `unavailable` - The video isn't available for streaming.
    string 'stream;
    # The product URI to rent the On Demand video.
    string? uri;
};

# Information about the videos that this user has liked.
public type UserMetadataConnectionsLikes record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of likes on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Activity31 record {
    # The category that this event occurred for. This will be preset for only "category" activity types.
    record {*Category;} category?;
    # The channel that this event occurred for. This will be present for only "channel" activity types.
    record {*Channel;} 'channel?;
    # Video associated with ths activity.
    record {*Video;} clip;
    # The group that this event occurred for. This will be present for only "group" activity types.
    record {*Group;} 'group?;
    # The activity's metadata.
    Activity31Metadata metadata;
    # The tag that this event occurred for. This will be present for only "tag" activity types.
    record {*Tag;} tag?;
    # Time that the event occurred.
    string time;
    # Activity type
    string 'type;
    # The user that this event occurred for. This will be present for "like", "appearance", and "share" activity types.
    record {*User;} user?;
};

# A collection of information that is connected to this resource.
public type GroupMetadataConnections record {
    # Information about the members or moderators of this group.
    GroupMetadataConnectionsUsers users;
    # Information about the videos contained within this group.
    GroupMetadataConnectionsVideos videos;
};

public type Body44 record {
    # An array of user URIs for the list of users to follow.
    string[] users;
};

public type Body43 record {
    # The video frame time in seconds to use as the album thumbnail.
    decimal time_code?;
};

public type CreativeCommons record {
    # The code that uniquely identifies this Creative Commons license:
    # 
    # Option descriptions:
    #  * `by` - Attribution
    #  * `by-nc` - Attribution Non-Commercial
    #  * `by-nc-nd` - Attribution Non-Commercial No Derivatives
    #  * `by-nc-sa` - Attribution Non-Commercial Share Alike
    #  * `by-nd` - Attribution No Derivatives
    #  * `by-sa` - Attribution Share Alike
    #  * `cc0` - Public Domain Dedication
    string code;
    # The description of this Creative Commons license.
    string name;
    # The canonical relative URI of the Creative Commons license.
    string? uri;
};

public type Body42 record {
    # A comma-separated list of video URIs.
    string videos;
};

# Information about this user's followed categories.
public type UserMetadataConnectionsCategories record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of categories on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Body49 record {
    # The name of the project.
    string name;
};

public type Body48 record {
    # The name of the project.
    string name;
};

public type Body46 record {
    # Whether the picture is the user's active portrait.
    boolean active?;
};

# A collection of information about the logo in the corner of the embeddable player.
public type EmbedsettingsLogos record {
    # A collection of information relating to custom logos in the embeddable player.
    EmbedsettingsLogosCustom custom;
    # Whether the Vimeo logo appears in the embeddable player for this video.
    boolean vimeo;
};

public type MevideosReviewPage record {
    # Enable or disable video review.
    boolean active?;
};

public type Body52 record {
    # The array of the names of the categories that you're suggesting.
    string[] category;
};

public type Body51 record {
    # A list of values describing the content in this video. You can find the full list in the [`/contentratings`](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint.
    string[] content_rating?;
    # The new description of the video.
    string description?;
    MevideosEmbed embed?;
    # The Creative Commons license.
    string license?;
    # The video's default language. For a full list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string locale?;
    # The new title for the video.
    string name?;
    # The password. When you set `privacy.view` to `password`, you must provide the password as an additional parameter.
    string password?;
    VideosvideoIdPrivacy privacy?;
    MevideosRatings ratings?;
    MevideosReviewPage review_page?;
    MevideosSpatial spatial?;
};

public type Body50 record {
    # A list of values describing the content in this video. Find the full list in the [/contentratings](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint.
    string[] content_rating?;
    # The description of the video.
    string description?;
    MevideosEmbed embed?;
    # The Creative Commons license.
    string license?;
    # The video's default language. For a full list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string locale?;
    # The title of the video.
    string name?;
    # The password. When you set `privacy.view` to `password`, you must provide the password as an additional parameter.
    string password?;
    MevideosPrivacy privacy?;
    MevideosRatings ratings?;
    MevideosReviewPage review_page?;
    MevideosSpatial spatial?;
    MevideosUpload upload;
};

# 360 spatial data.
public type VideoSpatial record {
    # 360 director timeline.
    VideoSpatialDirectorTimeline[] director_timeline;
    # The 360 field of view, from 30 (minimum) to 90 (maximum). The default is 50.
    decimal? field_of_view;
    # The 360 spatial projection:
    # 
    # Option descriptions:
    #  * `cubical` - The spatial projection is cubical.
    #  * `cylindrical` - The spatial projection is cylindrical.
    #  * `dome` - The spatial projection is dome-shaped.
    #  * `equirectangular` - The spatial projection is equirectangular.
    #  * `pyramid` - The spatial projection is pyramid-shaped.
    string? projection;
    # The 360 stereo format:
    # 
    # Option descriptions:
    #  * `left-right` - The stereo format is left-right.
    #  * `mono` - The audio is monaural.
    #  * `top-bottom` - The stereo format is top-bottom.
    string? stereo_format;
};

# The activity's metadata.
public type Activity31Metadata record {
    # A list of resource URIs related to the activity.
    Activity31MetadataConnections connections;
};

# Embed data for the album.
public type AlbumEmbed record {
    # The responsive HTML code to embed the playlist on a website. This is present only when `privacy.view` isn't password and when the album has embeddable videos.
    string? html;
};

# The recommendations for this video.
public type VideoMetadataConnectionsRecommendations record {
    # An array of HTTP methods allowed on this URI.
    string[] options?;
    # The API URI that resolves to the connection data.
    string uri?;
};

public type UserPreferences record {
    UserPreferencesVideos videos?;
};

public type Body39 record {
    # The hexadecimal code for the color of the player buttons.
    string brand_color?;
    # The description of the album.
    string description?;
    # The custom domain a user has selected for their album.
    string? domain?;
    # Whether to hide Vimeo navigation when displaying the album.
    boolean hide_nav?;
    # The type of layout for presenting the album.
    string layout?;
    # The name of the album.
    string name?;
    # The album's password. Required only if **privacy** is `password`.
    string password?;
    # The privacy level of the album.
    string privacy?;
    # Whether album videos should use the review mode URL.
    boolean review_mode?;
    # The default sort order of the album's videos.
    string sort?;
    # The color theme of the album.
    string theme?;
    # The custom Vimeo URL a user has selected for their album.
    string? url?;
    # Whether the user has opted in to use a custom domain for their album.
    boolean use_custom_domain?;
};

public type Body38 record {
    # The hexadecimal code for the color of the player buttons.
    string brand_color?;
    # The description of the album.
    string description?;
    # Whether to hide Vimeo navigation when displaying the album.
    boolean hide_nav?;
    # The type of layout for presenting the album.
    string layout?;
    # The name of the album.
    string name;
    # The album's password. Required only if **privacy** is `password`.
    string password?;
    # The privacy level of the album.
    string privacy?;
    # Whether album videos should use the review mode URL.
    boolean review_mode?;
    # The default sort order of the album's videos.
    string sort?;
    # The color theme of the album.
    string theme?;
};

# Information about the videos that this user has watched.
public type UserMetadataConnectionsWatchedVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Body37 record {
    # The user's bio.
    string bio?;
    # A list of values describing the content in this video. Find the full list in the [/contentratings](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint. You must provide a comma-separated list if you are using a query string or an array if you are using JSON.
    string[] content_filter?;
    # The user's custom Vimeo URL slug.
    string link?;
    # The user's location.
    string location?;
    # The user's display name.
    string name?;
    # The default password for all future videos that this user uploads. To use this field, the `videos.privacy.view` field must be `password`.
    string password?;
    MeVideos videos?;
};

public type MevideosRatingsTv record {
    # The reason for the video's TV rating.
    # 
    # Option descriptions:
    #  * `d` - Suggestive dialogue
    #  * `fv` - Fantasy violence
    #  * `l` - Language
    #  * `ss` - Sexual situations
    #  * `v` - Violence
    string reason?;
};

# Information about the comments on this video.
public type VideoMetadataConnectionsComments record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of comments on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Body41 record {
    # Whether to make this the active album logo.
    boolean active?;
};

# Metadata about the category.
public type CategoryMetadata record {
    # A collection of information that is connected to this resource.
    CategoryMetadataConnections connections;
    # The permissible actions related to the category.
    CategoryMetadataInteractions interactions;
};

public type Body40 record {
    # Whether to make this the active album thumbnail.
    boolean active?;
};

public type VideosvideoIdPrivacy record {
    # Whether a user can add the video to an album, channel, or group.
    boolean add?;
    # The privacy level required to comment on the video.
    string comments?;
    # Whether a user can download the video. Not available to users with a Basic membership.
    boolean download?;
    # The video's new embed settings. The `whitelist` value enables you to define all valid embed domains. See our [documentation](https://developer.vimeo.com/api/endpoints/videos#/{video_id}/privacy/domains) for details on adding and removing domains.
    string embed?;
    # The video's new privacy setting. When privacy is `users`, `application/json` is the only valid content type. Basic users can't set privacy to `unlisted`.
    string view?;
};

public type CommentMetadata record {
    CommentMetadataConnections connections;
};

# A list of resource URIs related to the album.
public type AlbumMetadataInteractions record {
    # An action indicating that the authenticated user is an admin of the album and may therefore add custom thumbnails. This data requires a bearer token with the `private` scope.
    AlbumMetadataInteractionsAddCustomThumbnails add_custom_thumbnails;
    # An action indicating that the authenticated user is an admin of the album and may therefore add custom logos. This data requires a bearer token with the `private` scope.
    AlbumMetadataInteractionsAddLogos add_logos;
    # An action indicating that the authenticated user is an admin of the album and may therefore add videos. This data requires a bearer token with the `private` scope.
    AlbumMetadataInteractionsAddVideos add_videos;
};

public type Body8 record {
    # The URI of a video to add.
    string video_uri;
};

public type Body9 record {
    # The URI of a video to remove.
    string video_uri;
};

public type Body6 record {
    # The array of either the user URIs or the user IDs to permit to view the private channel.
    string[] users;
};

public type Body29 record {
    # The grant type. Must be set to `vimeo_oauth1`.
    string grant_type;
    # The OAuth 1 token.
    string token;
    # The OAuth 1 token secret.
    string token_secret;
};

# A list of resource URIs related to the project.
public type ProjectMetadataConnections record {
    # A standard connection object indicating how to get all the videos in this project.
    ProjectMetadataConnectionsVideos videos;
};

public type Body7 record {
    # An array of tags to assign.
    string[] tag;
};

public type Body28 record {
    # The grant type. Must be set to `client_credentials`.
    string grant_type;
    # A space-separated list of the authentication [scopes](https://developer.vimeo.com/api/authentication#supported-scopes) that you want to access. The default is `public`.
    string scope;
};

public type CategorySubcategories record {
    # The URL to access the subcategory in a browser.
    string link;
    # The display name that identifies the subcategory.
    string name;
    # The unique identifier to access the subcategory resource.
    string uri;
};

public type Body4 record {
    # The URI of a user to remove as a moderator.
    string user_uri;
};

# The permissible actions related to the category.
public type CategoryMetadataInteractions record {
    # An action indicating if the authenticated user has followed this category.
    CategoryMetadataInteractionsFollow follow;
};

# Metadata about the album.
public type PortfolioMetadata record {
    # A list of resource URIs related to the album.
    PortfolioMetadataConnections connections;
};

# Appears only when the user has upload access and is looking at their own user record.
public type UserUploadQuota record {
    # Information about the user's lifetime upload usage.
    UserUploadQuotaLifetime lifetime;
    # Information about the user's usage for the current period.
    UserUploadQuotaPeriodic periodic;
    # Information about the user's upload space remaining for the current period.
    UserUploadQuotaSpace space;
};

public type Body5 record {
    # The URI of the user to add as a moderator.
    string user_uri;
};

public type Body2 record {
    # The array of category URIs to add.
    string[] channels;
};

public type Portfolio record {
    # The time in ISO 8601 format when the portfolio was created.
    string created_time;
    # The portfolio's description.
    string? description;
    # The link to the portfolio.
    string link;
    # Metadata about the album.
    PortfolioMetadata metadata;
    # The time in ISO 8601 format when the portfolio's data was last modified.
    string modified_time;
    # The display name of the portfolio.
    string name;
    # The default video sort order for the portfolio:
    # 
    # Option descriptions:
    #  * `alphabetical` - The default sort order is alphabetical by name.
    #  * `clips` - The default sort order is video creation date.
    #  * `modified` - The default sort order is the order in which the videos were modified.
    #  * `recent` - The default sort order is the order in which the videos were added.
    string sort;
    # The canonical relative URI of the portfolio.
    string uri;
};

public type Body3 record {
    # The URI of a user to add as a moderator.
    string user_uri;
};

# Information about the appearances of this user in other videos.
public type UserMetadataConnectionsAppearances record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of appearances on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type UserPreferencesVideos record {
    UserPreferencesVideosPrivacy privacy?;
};

public type Body22 record {
    # Whether the picture is the user's active portrait.
    boolean active?;
};

# Information about the users following or moderating this channel.
public type ChannelMetadataConnectionsUsers record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The context of the video's subscription, if this video is part of a subscription.
public type VideoContext record {
    # The contextual action:
    # 
    # Option descriptions:
    #  * `Added to` - An Added To action.
    #  * `Appearance by` - An Appearance By action.
    #  * `Liked by` - A Liked By action.
    #  * `Uploaded by` - An Unloaded By action.
    string action;
    # The contextual resource: a user, group, or channel representation, or an object of a tag.
    record {} 'resource;
    # The contextual resource type.
    string resource_type;
};

public type Body20 record {
    # An array of user URIs for the list of users to follow.
    string[] users;
};

public type Body27 record {
    # The authorization code received from the authorization server.
    string code;
    # The grant type. Must be set to `authorization_code`.
    string grant_type;
    # The redirect URI. Must match the URI from `/oauth/authorize`.
    string redirect_uri;
};

public type Body26 record {
    # A list of values describing the content in this video. Find the full list in the [/contentratings](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint.
    string[] content_rating?;
    # The description of the video.
    string description?;
    MevideosEmbed embed?;
    # The Creative Commons license.
    string license?;
    # The video's default language. For a full list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string locale?;
    # The title of the video.
    string name?;
    # The password. When you set `privacy.view` to `password`, you must provide the password as an additional parameter.
    string password?;
    MevideosPrivacy privacy?;
    MevideosRatings ratings?;
    MevideosReviewPage review_page?;
    MevideosSpatial spatial?;
    MevideosUpload upload;
};

# The privacy settings of the album.
public type AlbumPrivacy record {
    # The privacy-enabled password to see this album. Present only when `privacy.view` is `password`.
    string password?;
    # Who can view the album:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the album.
    #  * `embed_only` - Only owner can see album, can be embedded off-site
    #  * `password` - Only those with the password can view the album.
    string view;
};

# A collection of information that is connected to this resource.
public type TagMetadataConnections record {
    # Information about the videos related to this tag.
    TagMetadataConnectionsVideos videos;
};

public type EmbedSettings record {
    # A collection of information about the buttons that appear on the interface of the embeddable player.
    EmbedsettingsButtons buttons;
    # The primary player color, which controls the color of the progress bar, buttons, and more.
    string color;
    # A collection of information about the logo in the corner of the embeddable player.
    EmbedsettingsLogos logos;
    # Whether the playbar appears in the embeddable player for this video.
    boolean playbar;
    # Whether the speed controls appear in the embeddable player for this video.
    boolean speed;
    # A collection of information relating to the embeddable player's title bar.
    EmbedsettingsTitle title;
    # The URI of the embed preset.
    string uri?;
    # Whether the volume controls appear in the embeddable player for this video.
    boolean volume;
};

public type Body25 record {
    # The name of the project.
    string name;
};

public type Body24 record {
    # The name of the project.
    string name;
};

public type Play record {
    # Progressive files.
    PlayProgressive[] progressive?;
    # The play status of the video:
    # 
    # Option descriptions:
    #  * `playable` - The video is playable.
    #  * `purchase_required` - The video must be purchased.
    #  * `restricted` - Playback for the video is restricted.
    #  * `unavailable` - The video is unavailable.
    string status;
};

public type VideoVersions record {
    # Whether this video version is the currently active one.
    boolean active;
    # The API app associated with the video version.
    record {*ApiApp;} app;
    # The time in ISO 8601 for when the video version was created.
    string created_time;
    # The duration of the video version in seconds.
    decimal? duration;
    # The file name of the video version.
    string filename;
    # The size in byes of the video version file.
    decimal? filesize;
    # The video version's metadata.
    VideoversionsMetadata metadata;
    # The time in ISO 8601 format when the video version was last modified.
    string modified_time;
    # The Play representation.
    record {*Play;} play;
    # The upload information for this version.
    VideoversionsUpload upload;
    # The time in ISO 8601 format when the video version was uploaded.
    string? upload_date;
    # The version's canonical relative URI.
    string uri;
    # The owner of the video version.
    record {*User;} user;
};

# An action indicating that the authenticated user is an admin of the album and may therefore add custom logos. This data requires a bearer token with the `private` scope.
public type AlbumMetadataInteractionsAddLogos record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

public type MeVideos record {
    MeVideosPrivacy privacy?;
};

public type Body1 record {
    # The description of the channel.
    string description?;
    # The link to access the channel. You can use a custom name in the URL in place of a numeric channel ID, as in `/channels/{url_custom}`. Submitting `""` for this field removes the link alias.
    string link?;
    # The name of the channel.
    string name?;
    # The privacy level of the channel.
    string privacy?;
};

public type Tag record {
    # The normalized canonical tag name.
    string canonical;
    # Metadata about the group.
    TagMetadata metadata;
    # The tag value.
    string name;
    # The tag's resource key string.
    string resource_key;
    # The canonical relative URI of the tag.
    string uri;
};

# Information regarding where and how to report a user.
public type UserMetadataInteractionsReport record {
    # An array of the HTTP methods permitted on this URI.
    string[] options;
    # List of valid reasons for reporting a video.
    string[] reason;
    # The API URI that resolves to the connection data.
    string uri;
};

public type UserMetadataInteractions record {
    UserMetadataInteractionsAddPrivacyUser add_privacy_user?;
    # Information related to the block status of this user.
    UserMetadataInteractionsBlock block;
    # Information related to the followed status of this user.
    UserMetadataInteractionsFollow follow;
    # Information regarding where and how to report a user.
    UserMetadataInteractionsReport report;
};

# An action indicating that someone has joined the group. This data requires a bearer token with the `private` scope.
public type GroupMetadataInteractionsJoin record {
    # Whether the authenticated user has followed this group. This data requires a bearer token with the `private` scope.
    boolean added;
    # The time in ISO 8601 format when the user joined this group. This data requires a bearer token with the `private` scope.
    string? added_time;
    # The user's title, or the null value if not applicable. This data requires a bearer token with the `private` scope.
    string? title;
    # Whether the authenticated user is a moderator or subscriber. This data requires a bearer token with the `private` scope.
    # 
    # Option descriptions:
    #  * `member` - The authenticated user is a member.
    #  * `moderator` - The authenticated user is a moderator.
    string? 'type;
    # The URI for following. PUT to this URI to follow, or DELETE to this URI to unfollow. This data requires a bearer token with the `private` scope.
    string uri;
};

public type Body19 record {
    # The video frame time in seconds to use as the album thumbnail.
    decimal time_code?;
};

public type Body18 record {
    # A comma-separated list of video URIs.
    string videos;
};

public type Body17 record {
    # The hexadecimal code for the color of the player buttons.
    string brand_color?;
    # The description of the album.
    string description?;
    # The custom domain a user has selected for their album.
    string? domain?;
    # Whether to hide Vimeo navigation when displaying the album.
    boolean hide_nav?;
    # The type of layout for presenting the album.
    string layout?;
    # The name of the album.
    string name?;
    # The album's password. Required only if **privacy** is `password`.
    string password?;
    # The privacy level of the album.
    string privacy?;
    # Whether album videos should use the review mode URL.
    boolean review_mode?;
    # The default sort order of the album's videos.
    string sort?;
    # The color theme of the album.
    string theme?;
    # The custom Vimeo URL a user has selected for their album.
    string? url?;
    # Whether the user has opted in to use a custom domain for their album.
    boolean use_custom_domain?;
};

# Information about the users related to this category.
public type CategoryMetadataConnectionsUsers record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Body12 record {
    # Whether the image created by the `time` field should be the default thumbnail for the video.
    boolean active?;
    # Creates an image of the video from the given time offset.
    decimal time?;
};

# Information about the users who have liked this video.
public type VideoMetadataConnectionsLikes record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of likes on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Album record {
    # Whether an album should allow continuous play.
    boolean allow_continuous_play;
    # Whether an album should allow downloads.
    boolean allow_downloads;
    # Whether an album should allow sharing.
    boolean allow_share;
    # Hexadecimal color code for the decorative color. For example, album videos use this color for player buttons.
    string? brand_color;
    # The time in ISO 8601 format that the album was created.
    string created_time;
    # The custom logo for this album.
    record {*Picture;} custom_logo;
    # A brief description of the album's content.
    string? description;
    # The custom domain a user has selected for their album.
    string? domain;
    # The total duration in seconds of all the videos in the album.
    decimal duration;
    # Embed data for the album.
    AlbumEmbed embed;
    # Whether to show the album's custom brand color in the player of the album's embedded playlist.
    boolean? embed_brand_color;
    # Whether to show the album's custom logo in the player of the album's embedded playlist.
    boolean? embed_custom_logo;
    # Whether to hide the Vimeo navigation when viewing the album.
    boolean hide_nav;
    # Whether to hide the Vimeo logo in the player of the album's embedded playlist.
    boolean? hide_vimeo_logo;
    # The album's layout preference
    string layout;
    # The URL to access the album.
    string link;
    # Metadata about the album.
    AlbumMetadata metadata;
    # The time in ISO 8601 format when the album was last modified.
    string modified_time;
    # The album's display name.
    string name;
    # The active image for the album; defaults to the thumbnail of the last video added to the album.
    record {*Picture;} pictures;
    # The privacy settings of the album.
    AlbumPrivacy privacy;
    # The album resource key.
    string resource_key;
    # Whether album videos should use the review mode URL.
    boolean review_mode;
    # Sort type of the album.
    string sort;
    # The album's color theme preference
    string theme;
    # The album's URI.
    string uri;
    # The custom Vimeo URL a user has selected for their album.
    string? url;
    # Whether the user has opted in to use a custom domain for their album.
    boolean use_custom_domain;
    # The owner of the album.
    record {*User;} user;
    # Whether an album should show the brand color in the web layout.
    boolean web_brand_color;
    # Whether an album's custom logo should be shown in the web layout.
    boolean web_custom_logo;
};

public type Body11 record {
    # The email address of the credited person.
    string email;
    # The name of the credited person.
    string name;
    # The role of the credited person.
    string role;
    # The URI of the Vimeo user who should be given credit in this video.
    string user_uri;
};

public type Body10 record {
    # The text of the comment.
    string text;
};

public type MevideosEmbedTitle record {
    # Show or hide the video title, or enable the user to determine whether the video title appears.
    string name?;
    # Show or hide the owner information, or enable the user to determine whether the owner information appears.
    string owner?;
    # Show or hide the owner portrait, or enable the user to determine whether the owner portrait appears.
    string portrait?;
};

# Metadata about the group.
public type GroupMetadata record {
    # A collection of information that is connected to this resource.
    GroupMetadataConnections connections;
    # User actions that have involved the group. This data requires a bearer token with the `private` scope.
    GroupMetadataInteractions interactions;
};

public type Body16 record {
    # The hexadecimal code for the color of the player buttons.
    string brand_color?;
    # The description of the album.
    string description?;
    # Whether to hide Vimeo navigation when displaying the album.
    boolean hide_nav?;
    # The type of layout for presenting the album.
    string layout?;
    # The name of the album.
    string name;
    # The album's password. Required only if **privacy** is `password`.
    string password?;
    # The privacy level of the album.
    string privacy?;
    # Whether album videos should use the review mode URL.
    boolean review_mode?;
    # The default sort order of the album's videos.
    string sort?;
    # The color theme of the album.
    string theme?;
};

public type Body15 record {
    # The user's bio.
    string bio?;
    # A list of values describing the content in this video. Find the full list in the [/contentratings](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint. You must provide a comma-separated list if you are using a query string or an array if you are using JSON.
    string[] content_filter?;
    # The user's custom Vimeo URL slug.
    string link?;
    # The user's location.
    string location?;
    # The user's display name.
    string name?;
    # The default password for all future videos that this user uploads. To use this field, the `videos.privacy.view` field must be `password`.
    string password?;
    MeVideos videos?;
};

# Information about this user's portraits.
public type UserMetadataConnectionsPictures record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of pictures on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Body13 record {
    # Active text tracks appear in the player and are visible to other users. Only one text track per language can be active.
    boolean active?;
    # The language of the text track. For a complete list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string language;
    # The name of the text track.
    string name;
    # The type of the text track.
    string 'type;
};

# The transcode information for a video upload.
public type VideoTranscode record {
    # Status code for this video's availability.
    string status?;
};

public type LegacyError record {
    # User-friendly error message
    string _error;
};

# Information about the versions of this video.
public type VideoMetadataConnectionsVersions record {
    # The URI of the current version of the video.
    string current_uri?;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of versions on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Metadata about the group.
public type TagMetadata record {
    # A collection of information that is connected to this resource.
    TagMetadataConnections connections;
};

public type Channel record {
    # The categories to which this channel belongs as specified by the channel moderators.
    Category[] categories;
    # The time in ISO 8601 format when the channel was created.
    string created_time;
    # A brief explanation of the channel's content.
    string? description;
    # The banner that appears by default at the top of the channel page.
    record {*Picture;} header;
    # The URL to access the channel in a browser.
    string link;
    # Metadata about the channel.
    ChannelMetadata metadata;
    # The time in ISO 8601 format when the album was last modified.
    string modified_time;
    # The display name that identifies the channel.
    string name;
    # The active image for the channel; defaults to the thumbnail of the last video added to the channel.
    record {*Picture;} pictures;
    # The privacy settings of the channel.
    ChannelPrivacy privacy;
    # The channel resource key.
    string resource_key;
    # An array of all tags assigned to this channel.
    Tag[] tags;
    # The unique identifier to access the channel resource.
    string uri;
    # The Vimeo user who owns the channel.
    record {*User;} user;
};

# Data from video associated with version
public type VideoversionsMetadataConnectionsVideo record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating that the authenticated user is an admin of the album and may therefore add custom thumbnails. This data requires a bearer token with the `private` scope.
public type AlbumMetadataInteractionsAddCustomThumbnails record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about the videos that this user wants to watch later.
public type UserMetadataConnectionsWatchlater record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about this video's ondemand data.
public type VideoMetadataConnectionsOndemand record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The On Demand connection resource key.
    string resource_key;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating that the authenticated user is a moderator of the channel and may therefore add or remove videos from the channel. This data requires a bearer token with the `private` scope.
public type ChannelMetadataInteractionsModerateVideos record {
    # An array of HTTP methods allowed on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

public type MevideosSpatialDirectorTimeline record {
    # The timeline pitch. This value must be between -90 and 90.
    decimal pitch;
    # The timeline roll.
    decimal roll?;
    # The 360 director timeline time code.
    decimal time_code;
    # The timeline yaw. This value must be between 0 and 360.
    decimal yaw;
};

# Information about the videos that belong to this channel.
public type ChannelMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating that the authenticated user is the owner of the channel and may therefore add other users as channel moderators. This data requires a bearer token with the `private` scope.
public type ChannelMetadataInteractionsAddModerators record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

public type Category record {
    # The active icon for the category.
    record {*Picture;} icon?;
    # The last time, in ISO 8601 format, that a video was featured.
    string last_video_featured_time;
    # The URL to access the category in a browser.
    string link;
    # Metadata about the category.
    CategoryMetadata metadata;
    # The display name that identifies the category.
    string name;
    # The container of this category's parent category, if the current category is a subcategory.
    CategoryParent parent;
    # The active picture for this category; defaults to vertical color bars.
    record {*Picture;} pictures;
    # The resource key of the category.
    string resource_key;
    # All the subcategories that belong to this category, if the current category is a top-level parent.
    CategorySubcategories[] subcategories?;
    # Whether the category isn't a subcategory of another category.
    boolean top_level;
    # The unique identifier to access the category resource.
    string uri;
};

public type User record {
    # The user's account type:
    # 
    # Option descriptions:
    #  * `basic` - The user has a Vimeo Basic subscription.
    #  * `business` - The user has a Vimeo Business subscription.
    #  * `live_business` - The user has a Vimeo Business Live subscription.
    #  * `live_premium` - The user has a Vimeo Premium subscription.
    #  * `live_pro` - The user has a Vimeo PRO Live subscription.
    #  * `plus` - The user has a Vimeo Plus subscription.
    #  * `pro` - The user has a Vimeo Pro subscription.
    #  * `pro_unlimited` - The user has a Vimeo PRO Unlimited subscription.
    #  * `producer` - The user has a Vimeo Producer subscription.
    string account;
    # The user's bio.
    string? bio;
    # The user's content filters:
    # 
    # Option descriptions:
    #  * `drugs` - Drugs or alcohol use.
    #  * `language` - Profanity or sexually suggestive content.
    #  * `nudity` - Nudity.
    #  * `safe` - Suitable for all audiences.
    #  * `unrated` - No rating.
    #  * `violence` - Violent or graphic content.
    string[] content_filter?;
    # The time in ISO 8601 format when the user account was created.
    string created_time;
    # The user's email address. This data requires a bearer token with the `email` scope.
    string email?;
    # The absolute URL of this user's profile page.
    string link;
    # The user's location.
    string? location;
    # The user's metadata.
    UserMetadata metadata;
    # The user's display name.
    string name;
    # The active portrait of this user.
    record {*Picture;} pictures;
    UserPreferences preferences?;
    # The user's resource key string.
    string resource_key;
    # Appears only when the user has upload access and is looking at their own user record.
    UserUploadQuota upload_quota;
    # The user's canonical relative URI.
    string uri;
    # The user's websites.
    UserWebsites[] websites;
};

public type MeVideosPrivacy record {
    # Whether a user can add the video to an album, channel, or group. This value becomes the default add setting for all future videos uploaded by the user.
    boolean add?;
    # Who can comment on the video. This value becomes the default comment setting for all future videos that this user uploads.
    string comments?;
    # Whether a user can download the video. This value becomes the default download setting for all future videos that this user uploads.
    boolean download?;
    # The privacy for embed videos. The `whitelist` value enables you to define all valid embed domains. See our [documentation](https://developer.vimeo.com/api/endpoints/videos#/{video_id}/privacy/domains) for adding and removing domains.
    string embed?;
    # Who can view the video. This value becomes the default view setting for all future videos that this user uploads.
    string view?;
};

# The privacy settings of the channel.
public type ChannelPrivacy record {
    # Who can view the channel:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the channel.
    #  * `moderators` - Only moderators can view the channel.
    #  * `users` - Only registered users can view the channel.
    string view;
};

public type MevideosEmbedButtons record {
    # Show or hide the Embed button.
    boolean embed?;
    # Show or hide the Fullscreen button.
    boolean fullscreen?;
    # Show or hide the HD button.
    boolean hd?;
    # Show or hide the Like button.
    boolean like?;
    # Show or hide the Scaling button (shown only in Fullscreen mode).
    boolean scaling?;
    # Show or hide the Share button.
    boolean share?;
    # Show or hide the Watch Later button.
    boolean watchlater?;
};

public type Credit record {
    # The name of the person credited.
    string name;
    # The character that this person portrayed, or the job that this person performed.
    string role;
    # The unique identifier to access the credits resource.
    string uri;
    # The Vimeo user associated with this credit.
    record {*User;} user?;
    # The video associated with this credit.
    record {*Video;} video?;
};

# A collection of information that is connected to this resource.
public type AlbumMetadataConnections record {
    # Information about the videos that belong to this album.
    AlbumMetadataConnectionsVideos videos;
};

# A Collection of recommended users for the current user to follow. This data requires a bearer token with the `private` scope.
public type UserMetadataConnectionsRecommendedUsers record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The total number of users on this connection. This data requires a bearer token with the `private` scope.
    decimal total;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

public type Auth record {
    # The access token string.
    string access_token;
    # The API application associated with the token.
    record {*ApiApp;} app;
    # The date and time that the token expires.
    string expires_on?;
    # The refresh token string.
    string refresh_token?;
    # The scope or scopes that the token supports.
    string scope;
    # The token type:
    # 
    # Option descriptions:
    #  * `bearer` - The token is of the `bearer` type.
    string token_type;
    # The user associated with the token.
    record {*User;} user?;
};

# Information about the videos that have been shared with this user.
public type UserMetadataConnectionsShared record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the users that the current user is following.
public type UserMetadataConnectionsFollowing record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the user's lifetime upload usage.
public type UserUploadQuotaLifetime record {
    # The number of bytes remaining in your lifetime maximum.
    decimal? free;
    # The total number of bytes that you can upload across the lifetime of your account.
    decimal? max;
    # The number of bytes that you've already uploaded against your lifetime limit.
    decimal? used;
};

public type Body record {
    # The description of the channel.
    string description?;
    # The link to access the channel. You can use a custom name in the URL in place of a numeric channel ID, as in `/channels/{url_custom}`.
    string link?;
    # The name of the channel.
    string name;
    # The privacy level of the channel.
    string privacy;
};

# Related content for this video.
public type VideoMetadataConnectionsRelated record {
    # An array of HTTP methods allowed on this URI.
    string[] options?;
    # The API URI that resolves to the connection data.
    string uri?;
};

# Metadata about the album.
public type AlbumMetadata record {
    # A collection of information that is connected to this resource.
    AlbumMetadataConnections connections;
    # A list of resource URIs related to the album.
    AlbumMetadataInteractions interactions;
};

public type Comment record {
    # The time in ISO 8601 format when the comment was posted.
    string created_on;
    CommentMetadata metadata;
    # The resource key string for the comment.
    string resource_key;
    # The content of the comment.
    string text;
    # The Vimeo content to which the comment relates:
    # 
    # Option descriptions:
    #  * `video` - The comment is about a video.
    string 'type;
    # The unique identifier to access the comment resource.
    string uri;
    # The user who posted the comment.
    record {*User;} user;
};

# A collection of information that is connected to this resource.
public type CategoryMetadataConnections record {
    # Information about the channels related to this category.
    CategoryMetadataConnectionsChannels channels;
    # Information about the groups related to this category.
    CategoryMetadataConnectionsGroups groups;
    # Information about the users related to this category.
    CategoryMetadataConnectionsUsers users;
    # Information about the videos related to this category.
    CategoryMetadataConnectionsVideos videos;
};

# Information about the videos related to this category.
public type CategoryMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# A collection of information that is connected to this resource.
public type ChannelMetadataConnections record {
    # Information provided to channel moderators about which users they have specifically permitted to access a private channel. This data requires a bearer token with the `private` scope.
    ChannelMetadataConnectionsPrivacyUsers privacy_users;
    # Information about the users following or moderating this channel.
    ChannelMetadataConnectionsUsers users;
    # Information about the videos that belong to this channel.
    ChannelMetadataConnectionsVideos videos;
};

# Information about the videos contained within this group.
public type GroupMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type UserMetadataInteractionsAddPrivacyUser record {
    # An array of the HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options?;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri?;
};

public type VideosvideoIdversionsUpload record {
    # Upload approach
    string approach;
    # If your upload approach is pull, Vimeo will download the video hosted at this public URL. This URL must be valid for at least 24 hours.
    string link?;
    # The app's redirect URL. Use this parameter when `approach` is `post`.
    string redirect_url?;
    # Upload size
    string size?;
};

# Information about the videos that belong to this album.
public type AlbumMetadataConnectionsVideos record {
    # An array of the HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the videos uploaded by this user.
public type UserMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about where and how to report a video.
public type VideoMetadataInteractionsReport record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # A list of valid reasons for reporting a video.
    string[] reason;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating if the authenticated user has followed this category.
public type CategoryMetadataInteractionsFollow record {
    # Whether the authenticated user has followed this category.
    boolean added;
    # The time in ISO 8601 format that the user followed this category, or the null value if the user hasn't followed this category.
    string? added_time;
    # The URI for following or unfollowing this category: PUT to this URI to follow the category, or DELETE to this URI to unfollow the category.
    string uri;
};

public type CommentMetadataConnections record {
    # Information about this comment's replies.
    CommentMetadataConnectionsReplies replies;
};

# Information about whether the authenticated user has liked this video.
public type VideoMetadataInteractionsLike record {
    # Whether the user has liked the video.
    boolean added;
    # The time in ISO 8601 format when the user liked the video.
    string added_time;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};
