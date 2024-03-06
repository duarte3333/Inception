<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', __MYSQL_DATABASE__);

/** Database username */
define( 'DB_USER', __MYSQL_USER__ );

/** Database password */
define( 'DB_PASSWORD', __MYSQL_PASSWORD__ );

/** Database hostname */
define( 'DB_HOST', __DB_HOST__ );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
// define( 'AUTH_KEY',         'put your unique phrase here' );
// define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
// define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
// define( 'NONCE_KEY',        'put your unique phrase here' );
// define( 'AUTH_SALT',        'put your unique phrase here' );
// define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
// define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
// define( 'NONCE_SALT',       'put your unique phrase here' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'incep_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */
define( 'WP_DEBUG_LOG', '/tmp/wp-errors.log' );


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

define( 'WP_CACHE', true);
define( 'WP_CACHE_KEY_SALT',  '_server_name_');


/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

// This is the configuration file for a WordPress website. 
// Here's a simplified explanation of some key parts:

// define( 'DB_NAME', __MYSQL_DATABASE__); etc: These lines 
// set up the connection to the database where WordPress stores 
// all its data. You need to replace __MYSQL_DATABASE__, __MYSQL_USER__, 
// __MYSQL_PASSWORD__, and __DB_HOST__ with your actual database name, user, password, and host.
    
// define( 'AUTH_KEY', 'put your unique phrase here' ); etc: 
// These lines are for security. They should be unique phrases 
// that WordPress uses to authenticate users. You can generate 
// these using the link provided in the comments.
    
// $table_prefix = 'incep_';: This sets the prefix for all 
// the tables in the WordPress database. If you have multiple 
// WordPress installations in one database, each should have a unique prefix.
    
// define( 'WP_DEBUG', true );: This line enables WordPress's 
// debugging mode, which is useful for developers because it displays error messages.
    
// define( 'WP_DEBUG_LOG', '/tmp/wp-errors.log' );: This 
// line sets the location where WordPress will log error messages.
    
// define( 'ABSPATH', __DIR__ . '/' );: This line sets 
// the absolute path to the WordPress directory.
    
// define( 'WP_CACHE', true); and define( 'WP_CACHE_KEY_SALT', 
// '_server_name_');: These lines enable and configure caching, which can improve your website's performance.
    
// require_once ABSPATH . 'wp-settings.php';: This line loads the main WordPress settings file.
    
    