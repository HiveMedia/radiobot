#Installer file settings
#DO NOT CHANGE unless the download id's have changed 
default['radiobot']['install'] = {
	'debian' => {
		'packages' => 'openssl sqlite3 libsqlite3-0 libmysqlclient18 libwxgtk2.8-0 libcurl3 libphysfs1 tcl8.5 libloudmouth1-0 libtag1c2a libtagc0 espeak espeak-data festival libssl1.0.0 libwxgtk2.8-0 libsqlite3-0 libmpg123-0 libogg0 libvorbis0a libvorbisfile3 libsndfile1 libavformat53 libavcodec53 libmp3lame0 libflac8 libresample1 libfaac0 libprotobuf7 libmuparser2 liblua5.1-0 libaacplus2 libsoxr0',
		'downloads' => {
			'6' => {
				'i686' => 69,
				'x86_64' => 70
			},
			'7' => {
				'i686' => 94,
				'x86_64' => 93
			}
		},
		'override' => {
			'ubuntu' => {
				'packages' => 'openssl sqlite3 libwxgtk2.8-0 lame libtag1c2a libtagc0 libmp3lame0 libmp3lame-dev libogg-dev libvorbis-dev libsndfile1 libsndfile1-dev libavformat54 libavcodec54 libcurl4-openssl-dev libmpg123-0 libresample1 libncurses5 libphysfs1 libpcre3 libprotobuf8 libmysqlclient18 libfaac0 libopus0 libloudmouth1-0 libdbus-glib-1-2 libmuparser2 libsoxr0',
				'downloads' => {
					'13.10' => {
						'i386' => 66,
						'x86_64' => 68
					},
					'14.04' => {
						'i686' => 138,
						'x86_64' => 137
					},
				}
			}
		}
	},
	'rhel' => {
		'packages' => 'openssl sqlite mysql wxGTK cryptopp taglib physfs lame curl protobuf muParser lua libogg libvorbis mpg123 libresample lame-devel libsndfile ffmpeg flac opus',
		'downloads' => {
			'5' => {
				'i686' => 65,
				'x86_64' => 67
			},
			'6' => {
				'i686' => 71,
				'x86_64' => 63
			}
		}
	}
}

#Base settings
default['radiobot']['base']['nick'] = 'RadioBot'
default['radiobot']['base']['logfile'] = 'ircbot.log'
default['radiobot']['base']['do_spam'] = true
default['radiobot']['base']['do_on_join'] = true
default['radiobot']['base']['do_topic'] = true
default['radiobot']['base']['auto_reg_on_hello'] = true
default['radiobot']['base']['enable_request_sys'] = true
default['radiobot']['base']['enable_rating'] = true
default['radiobot']['base']['allow_pm_requests'] = true
default['radiobot']['base']['remote_port'] = 10001
default['radiobot']['base']['dj_name'] = 'Standard'
default['radiobot']['base']['ssl_cert'] = 'ircbot.pem'
default['radiobot']['base']['reg_name'] = ''
default['radiobot']['base']['reg_key'] = ''

#IRC settings
default['radiobot']['irc']['servers'] = {
	'irc.host.com' => {
		'port' => 6667,
		'ssl' => false,
		'pass' => false,
		'identity_pass' => false,
		'bindip' => false,
		'channels' => {
			'#channel' => {
				'channel_pass' => false,
				'do_spam' => true,
				'do_on_join' => true,
				'do_topic' => true,
				'song_interval' => 0,
				'song_interval_source' => 0,
				'no_topic_check' => false
			}
		}
	}
}

#SS settings
default['radiobot']['server_streams']['servers'] = {
	'your_sc_server.com' => {
		'type' => 'shoutcast',
		'port' => 8000,
		'stream_id' => 1,
		'mount' => '/live',
		'user' => 'admin',
		'pass' => 'hackme'
	}
}

#AutoDJ settings

default['radiobot']['autodj']['server']['password'] = 'StreamPassword'
default['radiobot']['autodj']['server']['name'] = 'DJ Test'
default['radiobot']['autodj']['server']['description'] = 'Test Stream'
default['radiobot']['autodj']['server']['genre'] = 'Various'
default['radiobot']['autodj']['server']['url'] = 'http://www.yoururl.com'
default['radiobot']['autodj']['server']['icq'] = 11001100
default['radiobot']['autodj']['server']['aim'] = 'aim_name'
default['radiobot']['autodj']['server']['irc'] = 'irc://irc.yourirc.net/channel'
default['radiobot']['autodj']['server']['public'] = true
default['radiobot']['autodj']['server']['encoder'] = 'mp3'
default['radiobot']['autodj']['server']['bitrate'] = 64
default['radiobot']['autodj']['server']['sample'] = 44100
default['radiobot']['autodj']['server']['channels'] = 1
default['radiobot']['autodj']['server']['mount'] = '/'
default['radiobot']['autodj']['server']['music_dir'] = 'f:\my_music'
default['radiobot']['autodj']['server']['promos_dir'] = 'f:\my_promos'

default['radiobot']['autodj']['mp3_encoder']['mode'] = 'stereo'
default['radiobot']['autodj']['mp3_encoder']['vbr'] = 0
default['radiobot']['autodj']['mp3_encoder']['min_bitrate'] = 0
default['radiobot']['autodj']['mp3_encoder']['max_bitrate'] = 0
default['radiobot']['autodj']['mp3_encoder']['quality'] = 4		
default['radiobot']['autodj']['mp3_encoder']['vbr_quality'] = 4		

default['radiobot']['autodj']['queue_mysql']['host'] = 'host'
default['radiobot']['autodj']['queue_mysql']['user'] = 'user'
default['radiobot']['autodj']['queue_mysql']['pass'] = 'pass'
default['radiobot']['autodj']['queue_mysql']['port'] = 0
default['radiobot']['autodj']['queue_mysql']['db_name'] = 'ShoutIRC'
default['radiobot']['autodj']['queue_mysql']['db_table'] = 'AutoDJ'
default['radiobot']['autodj']['queue_mysql']['keep_history'] = 7

default['radiobot']['autodj']['options']['use_mysql_queue'] = false
default['radiobot']['autodj']['options']['resampler'] = 'speex'
default['radiobot']['autodj']['options']['no_play_filters'] = '*SomeJunk*,*more junk*'
default['radiobot']['autodj']['options']['no_repeat'] = 600
default['radiobot']['autodj']['options']['do_promos'] = '0'
default['radiobot']['autodj']['options']['num_promos'] = 1
default['radiobot']['autodj']['options']['enable_requests'] = true
default['radiobot']['autodj']['options']['enable_find'] = true
default['radiobot']['autodj']['options']['enable_crossface'] = false
default['radiobot']['autodj']['options']['enable_voice'] = false
default['radiobot']['autodj']['options']['voice_artist'] = 'www.ShoutIRC.com'
default['radiobot']['autodj']['options']['voice_title'] = 'The Voice of AutoDJ'
default['radiobot']['autodj']['options']['moved_dir'] = './moved'
default['radiobot']['autodj']['options']['auto_start'] = true
default['radiobot']['autodj']['options']['autoplay_if_no_source'] = false
default['radiobot']['autodj']['options']['enable_yp'] = true