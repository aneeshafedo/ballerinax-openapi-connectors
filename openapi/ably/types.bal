// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/http;

public type MessageArr Message[];

public type PresenceMessageArr PresenceMessage[];

public type StringArr string[];

public type IntArr int[];

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type PushPublishBody record {
    # Push
    Push push?;
    # Push recipient details for a device.
    Recipient recipient;
};

# Message object.
public type Message record {
    # The [client ID](https://www.ably.io/documentation/core-features/authentication#identified-clients) of the publisher of this message.
    string clientId?;
    # The connection ID of the publisher of this message.
    string connectionId?;
    # The string encoded payload, with the encoding specified below.
    string data?;
    # This will typically be empty as all messages received from Ably are automatically decoded client-side using this value. However, if the message encoding cannot be processed, this attribute will contain the remaining transformations not applied to the data payload.
    string encoding?;
    # Extras object. Currently only allows for [push](https://www.ably.io/documentation/general/push/publish#channel-broadcast-example) extra.
    Extras extras?;
    # A Unique ID that can be specified by the publisher for [idempotent publishing](https://www.ably.io/documentation/rest/messages#idempotent).
    string id?;
    # The event name, if provided.
    string name?;
    # Timestamp when the message was received by the Ably, as milliseconds since the epoch.
    int timestamp?;
};

public type InlineResponse2xx ChannelDetails[]|string[];

# A ChannelStatus instance.
public type ChannelStatus record {
    # A required boolean value indicating whether the channel that is the subject of the event is active. For events indicating regional activity of a channel this indicates activity in that region, not global activity.
    boolean isActive;
    # An Occupancy instance indicating the occupancy of a channel. For events indicating regional activity of a channel this indicates activity in that region, not global activity.
    Occupancy occupancy?;
};

# Extras object. Currently only allows for [push](https://www.ably.io/documentation/general/push/publish#channel-broadcast-example) extra.
public type Extras record {
    # Push
    Push push?;
};

# Notification
public type Notification record {
    # Text below title on the expanded notification.
    string body?;
    # Platform-specific, used to group notifications together.
    string collapseKey?;
    # Platform-specific icon for the notification.
    string icon?;
    # Platform-specific sound for the notification.
    string sound?;
    # Title to display at the notification.
    string title?;
};

public type PushPublishBody1 record {
    # Push
    Push push?;
    # Push recipient details for a device.
    Recipient recipient;
};

public type PushPublishBody2 record {
    # Push
    Push push?;
    # Push recipient details for a device.
    Recipient recipient;
};

public type TokenDetails record {
    # Regular expression representation of the capabilities of the token.
    string capability?;
    # Timestamp of token expiration.
    int expires?;
    # Timestamp of token creation.
    int issued?;
    # Name of the key used to create the token
    string keyName?;
    # The Ably Token.
    string token?;
};

public type KeynameRequesttokenBody TokenRequest|SignedTokenRequest;

# An Occupancy instance indicating the occupancy of a channel. For events indicating regional activity of a channel this indicates activity in that region, not global activity.
public type Occupancy record {
    # The number of connections that are authorised to enter members into the presence channel.
    int presenceConnections?;
    # The number of members currently entered into the presence channel.
    int presenceMembers?;
    # The number of connections that are authorised to subscribe to presence messages.
    int presenceSubscribers?;
    # The number of connections attached to the channel that are authorised to publish.
    int publishers?;
    # The number of connections attached that are authorised to subscribe to messages.
    int subscribers?;
};

public type TokenRequest record {
    # The [capabilities](https://www.ably.io/documentation/core-features/authentication#capabilities-explained) (i.e. a set of channel names/namespaces and, for each, a set of operations) which should be a subset of the set of capabilities associated with the key specified in keyName.
    record {} capability;
    # The [client ID](https://www.ably.io/documentation/core-features/authentication#identified-clients) to be assosciated with the token. Can be set to * to allow for any client ID to be used.
    string clientId?;
    # Name of the key used for the TokenRequest. The keyName comprises of the app ID and key ID on an API Key.
    string keyName;
    # An unquoted, un-escaped random string of at least 16 characters. Used to ensure the Ably TokenRequest cannot be reused.
    string nonce;
    # Time of creation of the Ably TokenRequest.
    int timestamp;
};

# Push
public type Push record {
    # Extends and overrides generic values when delivering via APNs. [See examples](https://www.ably.io/documentation/general/push/publish#payload-structure)
    PushApns apns?;
    # Arbitrary [key-value string-to-string payload](https://www.ably.io/documentation/general/push/publish#channel-broadcast-example).
    string data?;
    # Extends and overrides generic values when delivering via GCM/FCM. [See examples](https://www.ably.io/documentation/general/push/publish#payload-structure)
    PushFcm fcm?;
    # Notification
    Notification notification?;
    # Extends and overrides generic values when delivering via web. [See examples](https://www.ably.io/documentation/general/push/publish#payload-structure)
    PushWeb web?;
};

public type DeviceDetails record {
    # Optional trusted client identifier for the device.
    string clientId?;
    # Secret value for the device.
    string deviceSecret?;
    # Form factor of the push device.
    string formFactor?;
    # Unique identifier for the device generated by the device itself.
    string id?;
    # Optional metadata object for this device. The metadata for a device may only be set by clients with push-admin privileges and will be used more extensively in the future with smart notifications.
    record {} metadata?;
    # Platform of the push device.
    string platform?;
    # Push recipient details for a device.
    Recipient pushRecipient?;
    # the current state of the push device.
    string pushState?;
};

public type PresenceMessage record {
    # The event signified by a PresenceMessage.
    string action?;
    # The client ID of the publisher of this presence update.
    string clientId?;
    # The connection ID of the publisher of this presence update.
    string connectionId?;
    # The presence update payload, if provided.
    string data?;
    # This will typically be empty as all presence updates received from Ably are automatically decoded client-side using this value. However, if the message encoding cannot be processed, this attribute will contain the remaining transformations not applied to the data payload.
    string encoding?;
    # Extras object. Currently only allows for [push](https://www.ably.io/documentation/general/push/publish#channel-broadcast-example) extra.
    Extras extras?;
    # Unique ID assigned by Ably to this presence update.
    string id?;
    # Timestamp when the presence update was received by Ably, as milliseconds since the epoch.
    int timestamp?;
};

# Extends and overrides generic values when delivering via APNs. [See examples](https://www.ably.io/documentation/general/push/publish#payload-structure)
public type PushApns record {
    # Notification
    Notification notification?;
};

public type PushChannelsubscriptionsBody2 record {
    # Channel name.
    string channel?;
    # Must be set when clientId is empty, cannot be used with clientId.
    string deviceId?;
}|record {
    # Channel name.
    string channel?;
    # Must be set when deviceId is empty, cannot be used with deviceId.
    string clientId?;
};

# Extends and overrides generic values when delivering via web. [See examples](https://www.ably.io/documentation/general/push/publish#payload-structure)
public type PushWeb record {
    # Notification
    Notification notification?;
};

public type PushChannelsubscriptionsBody record {
    # Channel name.
    string channel?;
    # Must be set when clientId is empty, cannot be used with clientId.
    string deviceId?;
}|record {
    # Channel name.
    string channel?;
    # Must be set when deviceId is empty, cannot be used with deviceId.
    string clientId?;
};

public type PushChannelsubscriptionsBody1 record {
    # Channel name.
    string channel?;
    # Must be set when clientId is empty, cannot be used with clientId.
    string deviceId?;
}|record {
    # Channel name.
    string channel?;
    # Must be set when deviceId is empty, cannot be used with deviceId.
    string clientId?;
};

public type ChannelDetails record {
    # The required name of the channel including any qualifier, if any.
    string channelId;
    # In events relating to the activity of a channel in a specific region, this optionally identifies whether or not that region is responsible for global coordination of the channel.
    boolean isGlobalMaster?;
    # In events relating to the activity of a channel in a specific region, this optionally identifies the region.
    string region?;
    # A ChannelStatus instance.
    ChannelStatus status?;
};

# Extends and overrides generic values when delivering via GCM/FCM. [See examples](https://www.ably.io/documentation/general/push/publish#payload-structure)
public type PushFcm record {
    # Notification
    Notification notification?;
};

# Returned error from failed REST.
public type Error record {
    # Error code.
    int code?;
    # Link to help with error.
    string href?;
    # Message explaining the error's cause.
    string message?;
    # Server ID with which error was encountered.
    string serverId?;
    # Status error code.
    int statusCode?;
};

# Push recipient details for a device.
public type Recipient record {
    # Client ID of recipient
    string clientId?;
    # Client ID of recipient
    string deviceId?;
    # when using APNs, specifies the required device token.
    string deviceToken?;
    # when using GCM or FCM, specifies the required registration token.
    string registrationToken?;
    # Defines which push platform is being used.
    string transportType?;
};

public type InlineResponse2xx1 record {
    string channel?;
    string messageId?;
};

public type SignedTokenRequest record {
    *TokenRequest;
    # A signature, generated as an HMAC of each of the above components, using the key secret value.
    string mac;
};
