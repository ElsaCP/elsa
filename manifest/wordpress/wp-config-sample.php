<?php

/**
 * Database configuration
 */
define('DB_NAME',      'database_name_here');
define('DB_USER',      'username_here');
define('DB_PASSWORD',  'password_here');
define('DB_HOST',      'localhost');
define('DB_CHARSET',   'utf8');
define('DB_COLLATE',   '');

$table_prefix  = 'web_';

/**
 * Authentication Unique Keys and Salts.
 */
define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');

/*
## Multi Sites
define('WP_DEFAULT_THEME',     'your-default-theme');
define('WPCOM_API_KEY',        'put-your-key-here');
define('WP_ALLOW_MULTISITE',   true);
define('MULTISITE',            true);
define('SUBDOMAIN_INSTALL',    true);
define('DOMAIN_CURRENT_SITE',  'example.com');
define('NOBLOGREDIRECT',       'example.com');
define('PATH_CURRENT_SITE',    '/');
define('SITE_ID_CURRENT_SITE',  1);
define('BLOG_ID_CURRENT_SITE',  1);
define('SUNRISE', 'on');
*/

/**
 * For developers: WordPress debugging mode and Multiuser.
 *
 * Banned subdomain list for multisite instaolation:
 * m1m1n about access account accounts add address adm admin administrator administration adult advertising affiliate affiliates ajax analytics android anon anonymous api app apps archive atom auth authentication avatar backup banner banners bin billing blog blogs board bot bots business chat cache cadastro calendar campaign careers cgi client cliente code comercial compare config connect contact contest create code compras css dashboard data db design delete demo design designer dev devel dir directory dns dnsadmin doc docs domain download downloads edit editor email ecommerce forum forums faq favorite feed feedback flog follow file files free ftp gadget gadgets games guest group groups help home homepage host hosting hostname html http httpd https hpg info information image img images imap index invite intranet indice ipad iphone irc java javascript job jobs js knowledgebase log login logs logout list lists mail mail1 mail2 mail3 mail4 mail5 mailer mailing main mx manager marketing master me media message microblog microblogs mine mp3 msg msn mysql messenger mob mobile movie movies music musicas my name named net network new news newsletter nick nickname notes noticias ns ns1 ns2 ns3 ns4 old online operator order orders page pager pages panel password perl pic pics photo photos photoalbum php plugin plugins pop pop3 post postmaster postfix posts profile project projects promo pub public python random register registration root ruby rss sale sales sample samples script scripts secure send service shop sql signup signin search security settings setting setup site sites sitemap smtp soporte ssh stage staging start subscribe subdomain suporte support stat static stats status store stores sysadmin system tablet tablets tech telnet test test1 test2 test3 teste tests theme themes tmp todo task tasks tools tv talk update upload url user username usuario usage vendas video videos visitor win ww www www1 www2 www3 www4 www5 www6 www7 wwww wws wwws web webmail website websites webmaster workshop xxx xpg you yourname yourusername yoursite yourdomain
 */
define('WP_DEBUG',             false);
define('WP_DEBUG_LOG',         true);
define('WP_DEBUG_DISPLAY',     false);
define('WP_AUTO_UPDATE_CORE',  true);
define('WP_POST_REVISIONS',    false);
define('WP_ALLOW_REPAIR',      true);
define('MEDIA_TRASH',          false);
define('IMAGE_EDIT_OVERWRITE', true);
define('DISABLE_NAG_NOTICES',  true);
define('DISABLE_WP_CRON',      false);
define('DISALLOW_FILE_EDIT',   true);
define('FORCE_SSL_ADMIN',      false);
define('FORCE_SSL_LOGIN',      false);
define('AUTOSAVE_INTERVAL',    300);
define('EMPTY_TRASH_DAYS',     0);
define('WP_MAX_MEMORY_LIMIT', '256M');
define('WP_MEMORY_LIMIT',     '128M');
define('FS_METHOD',         'direct');

/**
 * Set the following constants in wp-config.php
 * These should be added somewhere BEFORE the
 * constant ABSPATH is defined.
 */
define( 'SMTP_USER',   'user@gmail.com' );    // Username to use for SMTP authentication
define( 'SMTP_PASS',   'your_smtp_password' );       // Password to use for SMTP authentication
define( 'SMTP_HOST',   'smtp.gmail.com' );    // The hostname of the mail server
define( 'SMTP_FROM',   'noreply@example.com' ); // SMTP From email address
define( 'SMTP_NAME',   'e.g Website Name' );    // SMTP From name
define( 'SMTP_PORT',   '587' );                  // SMTP port number - likely to be 25, 465 or 587
define( 'SMTP_SECURE', 'tls' );                 // Encryption system to use - ssl or tls
define( 'SMTP_AUTH',    true );                 // Use SMTP authentication (true|false)
define( 'SMTP_DEBUG',   0 );                    // for debugging purposes only set to 1 or 2

/*
 * Use for Object Cache
 */
define('WP_CACHE_KEY_SALT',  DB_NAME);
define('WP_CACHE',           true);

/*
 * That's all, stop editing! Happy blogging.
 */
if ( !defined('ABSPATH') ) { define('ABSPATH', dirname(__FILE__) . '/'); }
require_once(ABSPATH . 'wp-settings.php');
