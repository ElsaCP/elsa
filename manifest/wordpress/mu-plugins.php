<?php defined( 'ABSPATH' ) or die( 'No script kiddies please!' );
/*
 * Plugin Name: Optimator
 * Plugin URI: https://aris.web.id/
 * Description: Some basic WordPress configuration optimization to make it better than default. This plugin contains other simplified plugins and snippets.
 * Author: Aris Ripandi
 * Author URI: https://aris.web.id/
 * Version: 1.0
 * License: GPLv3
 * Text Domain: optimator
 * Info: You can put this plugin into /wp-content/mu-plugins directory if you want to executed automatically.
*/

// Add some links on plugin page
function wpcore_settings_link( $links ) {
    array_unshift( $links, '<a href="https://aris.web.id">Author</a>' );
    array_unshift( $links, '<a href="https://twitter.com/riipandi">Feedback</a>' );
    return $links;
}
$plugin = plugin_basename(__FILE__);
add_filter( "plugin_action_links_$plugin", "wpcore_settings_link" );

// Remove Query String
function awp_remove_script_version( $src ){
    $parts = explode( '?', $src );
    return $parts[0];
}
add_filter( 'script_loader_src', 'awp_remove_script_version', 15, 1 );
add_filter( 'style_loader_src', 'awp_remove_script_version', 15, 1 );

// Remove Welcome Panel
remove_action('welcome_panel', 'wp_welcome_panel');

// Remove Meta Generator
function arwpcustom_remove_version() {
    return '';
}
add_filter('the_generator', 'arwpcustom_remove_version');

// Disable Pingback
function no_self_ping( &$links ) {
    $home = get_option( 'home' );
    foreach ( $links as $l => $link )
        if ( 0 === strpos( $link, $home ) )
            unset($links[$l]);
}
add_action( 'pre_ping', 'no_self_ping' );

// Disable Post by Email
add_filter('enable_post_by_email_configuration', '__return_false');


// Hide Help Panel
function awp_remove_help_tabs( $old_help, $screen_id, $screen ){
    $screen->remove_help_tabs();
    return $old_help;
}
add_filter( 'contextual_help', 'awp_remove_help_tabs', 999, 3 );

// Enabe Automatic Update Themes and Plugins
add_filter( 'auto_update_plugin', '__return_true' );
add_filter( 'auto_update_theme', '__return_true' );

// Disable Automatic Update Email Notification
function wpb_stop_update_emails( $send, $type, $core_update, $result ) {
    if ( ! empty( $type ) && $type == 'success' ) {
        return false;
    }
    return true;
}
add_filter( 'auto_core_update_send_email', 'wpb_stop_auto_update_emails', 10, 4 );

// Remove URL Field on Comment
function disable_comment_url($fields) {
    if ( isset( $fields['url'] ) ) { unset($fields['url']); }
    if ( isset( $fields['fields']['url'] ) ) { unset($fields['fields']['url']); }
    return $fields;
}
add_filter('comment_form_default_fields', 'disable_comment_url');

// Disable Comments on Attachments
function disable_comments_on_attachments( $open, $post_id ) {
    $post = get_post( $post_id );
    if( $post->post_type == 'attachment' ) {
        return false;
    }
    return $open;
}
add_filter( 'comments_open', 'disable_comments_on_attachments', 10 , 2 );

// Moving the Comment Text Field to Bottom
function wpb_move_comment_field_to_bottom( $fields ) {
    $comment_field = $fields['comment'];
    unset( $fields['comment'] );
    $fields['comment'] = $comment_field;
    return $fields;
}
add_filter( 'comment_form_fields', 'wpb_move_comment_field_to_bottom' );

// Customize WP Admin Toolbar
function custom_toolbar($wp_admin_bar) {
    $args = array(
        'id' => 'arwpcustom',
        'title' => 'Portal SukabumiToday',
        'href' => 'https://sukabumitoday.com',
        'meta' => array(
            'class' => 'arwpcustom',
            'title' => 'Portal SukabumiToday'
            )
    );
    $wp_admin_bar->add_node($args);
    $wp_admin_bar->remove_node( 'wp-logo' );
}
add_action('admin_bawp_menu', 'custom_toolbar', 999);

// Change The Admin Footer Text
function custom_footer_admin () {
    $text  = 'Powered by <a href="//wordpress.org/" target="_new">WordPress</a>';
    $text .= '&nbsp;|&nbsp;';
    $text .= 'Developed by <a href="//sukabumitoday.com/" target="_new">SukabumiToday</a>';
    echo $text;
}
add_filter('admin_footer_text', 'custom_footer_admin');

// Remove the Login Shake Effect
function wpb_remove_loginshake() {
    remove_action('login_head', 'wp_shake_js', 12);
}
add_action('login_head', 'wpb_remove_loginshake');

// Cleaner Filenames
function awp_sanitize_file_name( $filename ) {
    $sanitized_filename = remove_accents( $filename ); // Convert to ASCII
    $invalid = array(' '   => '-', '%20' => '-', '_'   => '-');
    $sanitized_filename = str_replace( array_keys( $invalid ), array_values( $invalid ), $sanitized_filename );
    $sanitized_filename = preg_replace('/[^A-Za-z0-9-\. ]/', '', $sanitized_filename); // Remove all non-alphanumeric except .
    $sanitized_filename = preg_replace('/\.(?=.*\.)/', '', $sanitized_filename); // Remove all but last .
    $sanitized_filename = preg_replace('/-+/', '-', $sanitized_filename); // Replace any more than one - in a row
    $sanitized_filename = str_replace('-.', '.', $sanitized_filename); // Remove last - if at the end
    $sanitized_filename = strtolower( $sanitized_filename ); // Lowercase
    return $sanitized_filename;
}
add_filter( 'sanitize_file_name', 'awp_sanitize_file_name', 10, 1 );

// Customize Login Panel
add_action( 'login_head', 'login_function' );
function login_function() {
    add_filter( 'gettext', 'username_change', 20, 3 );
    function username_change( $translated_text, $text, $domain ) {
        if ( $text === 'Username or Email Address' ) {
            $translated_text = 'Email';
        }
        return $translated_text;
    }
}

// Customize Login Page
function my_login_logo_url_title() { return 'Back to ' . get_bloginfo('name'); }
function my_login_logo_url() { return get_bloginfo('url'); }
function change_admin_login_logo() {
    $css  = '<style>#login h1 a, .login h1 a { background-image: url("//res.cloudinary.com/sukabumitoday/image/upload/c_scale,w_100/v1518622119/logo-256x256_zs5xgn.png");';
    $css .= 'width: 100px; height: 100px; background-size: cover; display: block; border: none;';
    $css .= 'border-radius: 100px; -webkit-border-radius: 100px; -moz-border-radius: 100px; } p#nav {text-align: center; color: #fff;}';
    //$css .= 'body.login { background-image: url("https://source.unsplash.com/random/1920x1200"); background-size: 100%; background-attachment: fixed;}';
    $css .= '.forgetmenot, .privacy-policy-page-link { display: none !important;} #backtoblog {text-align: center;} #wp-submit {width: 100%;}</style>';
    echo $css;
}
add_action( 'login_enqueue_scripts', 'change_admin_login_logo' );
add_filter( 'login_headertitle', 'my_login_logo_url_title' );
add_filter( 'login_headerurl', 'my_login_logo_url' );

// Change Howdy Label Admin Panel
add_action( 'admin_bawp_menu', 'wp_admin_bawp_my_custom_account_menu', 11 );
function wp_admin_bawp_my_custom_account_menu( $wp_admin_bar ) {
    $user_id = get_current_user_id();
    $current_user = wp_get_current_user();
    $profile_url = get_edit_profile_url( $user_id );
    if ( 0 != $user_id ) {
        $avatar = get_avatar( $user_id, 28 );
        $howdy = sprintf( __('Halo, %1$s'), $current_user->display_name );
        $class = empty( $avatar ) ? '' : 'with-avatar';
        $wp_admin_bar->add_menu(array(
            'id'     => 'my-account',
            'parent' => 'top-secondary',
            'title'  => $howdy . $avatar,
            'href'   => $profile_url,
            'meta'   => array(
            'class'  => $class,
        )));
    }
}

// Remove Update Notice for Inacvite Plugins
function update_active_plugins($value = '') {
    if ((isset($value->response)) && (count($value->response))) {
        // Get the list cut current active plugins
        $active_plugins = get_option('active_plugins');
        if ($active_plugins) {
            //  Here we start to compare the $value->response
            //  items checking each against the active plugins list.
            foreach($value->response as $plugin_idx => $plugin_item) {
                // If the response item is not an active plugin then remove it.
                // This will prevent WordPress from indicating the plugin needs update actions.
                if (!in_array($plugin_idx, $active_plugins))
                    unset($value->response[$plugin_idx]);
            }
        } else {
             // If no active plugins then ignore the inactive out of date ones.
            foreach($value->response as $plugin_idx => $plugin_item) {
                unset($value->response);
            }
        }
    }
    return $value;
}
add_filter('site_transient_update_plugins', 'update_active_plugins');

// Add URL Column Media Library
function muc_column( $cols ) {
    $cols["media_url"] = "URL";
    return $cols;
}
function muc_value( $column_name, $id ) {
    if ( $column_name == "media_url" ) echo '&nbsp;&nbsp;<input type="text" width="100%" onclick="jQuery(this).select();" value="'. wp_get_attachment_url( $id ). '" readonly="true">';
}
add_filter( 'manage_media_columns', 'muc_column' );
add_action( 'manage_media_custom_column', 'muc_value', 10, 2 );

// Additional File Types to be Uploaded
function my_myme_types($mime_types){
    $mime_types['svg'] = 'image/svg+xml';
    $mime_types['psd'] = 'image/vnd.adobe.photoshop';
    return $mime_types;
}
add_filter('upload_mimes', 'my_myme_types', 1, 1);

// Use normal quotes instead of curly quotes
remove_filter('the_content', 'wptexturize');

/***************************************************************
 * Add Justify and Underline
 ***************************************************************/
add_filter( 'mce_buttons', 'awp_tiny_mce_buttons_rearrange', 5 );
add_filter( 'mce_buttons_2', 'awp_tiny_mce_buttons_2_rearrange', 5 );

function awp_tiny_mce_buttons_rearrange_list(){
    return $mce_buttons = array(
            'formatselect',        // Dropdown list with block formats to apply to selection.
            'bold',                // Applies the bold format to the current selection.
            'italic',            // Applies the italic format to the current selection.
            'underline',        // Applies the underline format to the current selection.
            'bullist',            // Formats the current selection as a bullet list.
            'numlist',            // Formats the current selection as a numbered list.
            'blockquote',        // Applies block quote format to the current block level element.
            'hr',                // Inserts a horizontal rule into the editor.
            'alignleft',        // Left aligns the current block or image.
            'aligncenter',        // Left aligns the current block or image.
            'alignright',        // Right aligns the current block or image.
            'alignjustify',        // Full aligns the current block or image.
            'link',                // Creates/Edits links within the editor.
            'unlink',            // Removes links from the current selection.
            'wp_more',            // Inserts the <!-- more --> tag.
            'spellchecker',        // ???
            'wp_adv',            // Toggles the second toolbar on/off.
            'dfw'                 // Distraction-free mode on/off.
        );
}

function awp_tiny_mce_buttons_2( $buttons_array ){
    $mce_buttons_2 = array(
            'formatselect',        // Dropdown list with block formats to apply to selection.
            'underline',        // Applies the underline format to the current selection.
            'alignjustify',        // Full aligns the current block or image.
            'forecolor',        // Applies foreground/text color to selection.
            'pastetext',        // Toggles plain text pasting mode on/off.
            'removeformat',        // Removes the formatting from the current selection.
            'charmap',            // Inserts custom characters into the editor.
            'outdent',            // Outdents the current list item or block element.
            'indent',            // Indents the current list item or block element.
            'undo',                // Undoes the last operation.
            'redo',                // Redoes the last undoed operation.
            'wp_help'            // Opens the help.
        );
    if ( in_array( 'code', $buttons_array ) ){ $mce_buttons_2[] = 'code'; }
    return $mce_buttons_2;
}

function awp_tiny_mce_buttons_rearrange( $buttons_array ){

    $mce_buttons = awp_tiny_mce_buttons_rearrange_list();

    //Keep extra buttons by comparing two buttons lines
    $mce_buttons_2 = awp_tiny_mce_buttons_2_rearrange_list();
    foreach( $buttons_array as $button ){
        if( !in_array( $button, $mce_buttons ) && !in_array( $button, $mce_buttons_2 ) ){
            array_push( $mce_buttons, $button );
        }
    }
    return $mce_buttons;
}

function awp_tiny_mce_buttons_2_rearrange( $buttons_array ){

    $mce_buttons_2 = awp_tiny_mce_buttons_2_rearrange_list();

    //Keep extra buttons by comparing two buttons lines
    $mce_buttons = awp_tiny_mce_buttons_rearrange_list();
    foreach( $buttons_array as $button ){
        if( !in_array( $button, $mce_buttons_2 ) && !in_array( $button, $mce_buttons ) ){
            array_push( $mce_buttons_2, $button );
        }
    }
    return $mce_buttons_2;
}

function awp_tiny_mce_buttons_2_rearrange_list(){
    return $mce_buttons_2 = array(
            'strikethrough',    // Applies strike though format to the current selection.
            'forecolor',        // Applies foreground/text color to selection.
            'pastetext',        // Toggles plain text pasting mode on/off.
            'removeformat',        // Removes the formatting from the current selection.
            'charmap',            // Inserts custom characters into the editor.
            'outdent',            // Outdents the current list item or block element.
            'indent',            // Indents the current list item or block element.
            'undo',                // Undoes the last operation.
            'redo',                // Redoes the last undoed operation.
            'wp_help'            // Opens the help.
        );
}

// Hide WP Logo Admin Panel
function annointed_admin_bar_remove() {
    global $wp_admin_bar;
    $wp_admin_bar->remove_menu('wp-logo');
    $wp_admin_bar->remove_menu('view-site');
}
add_action('wp_before_admin_bar_render', 'annointed_admin_bar_remove', 0);

// Remove Standar Widget
function unregister_default_wp_widgets() {
  unregister_widget('WP_Widget_Calendar');
  unregister_widget('WP_Widget_Calendar');
  unregister_widget('WP_Widget_Recent_Comments');
}
add_action('widgets_init', 'unregister_default_wp_widgets', 1);

// Remove MetaBoxes
function remove_meta_boxes() {
  # Removes meta from Posts #
  remove_meta_box('postcustom','post','normal');
  remove_meta_box('trackbacksdiv','post','normal');
  remove_meta_box('commentstatusdiv','post','normal');
  remove_meta_box('commentsdiv','post','normal');
  # Removes meta from pages #
  remove_meta_box('postcustom','page','normal');
  remove_meta_box('trackbacksdiv','page','normal');
  remove_meta_box('commentstatusdiv','page','normal');
  remove_meta_box('commentsdiv','page','normal');
}
add_action('admin_init','remove_meta_boxes');

// Load jQuery in Footer
function jquery_in_footer( &$scripts) {
    if ( ! is_admin() )
        $scripts->add_data( 'jquery', 'group', 1 );
}
add_action( 'wp_default_scripts', 'jquery_in_footer' );

// Creating a shortcode to display user count
add_shortcode('user_count', 'wpb_user_count');
function wpb_user_count() {
    $usercount = count_users();
    $result = $usercount['total_users'];
    return $result;
}

// Time to login period
add_filter( 'auth_cookie_expiration', 'arwp_stay_logged_in' );
function arwp_stay_logged_in( $expire ) {
    return 10800; // 3 hours in seconds
}

// Disable admin bar except for admin
add_action('after_setup_theme', 'remove_admin_bar');
function remove_admin_bar() {
    if (!current_user_can('administrator') && !is_admin()) {
        show_admin_bar(false);
    }
}

// Make featured image required for publishing a blog post
add_action('save_post', 'wpds_check_thumbnail');
add_action('admin_notices', 'wpds_thumbnail_error');
function wpds_check_thumbnail( $post_id ) {
    if( get_post_type($post_id) != 'post' )
        return;

    if ( ! has_post_thumbnail( $post_id ) ) {
        set_transient( "has_post_thumbnail", "no" );
        remove_action('save_post', 'wpds_check_thumbnail');
        wp_update_post(array('ID' => $post_id, 'post_status' => 'draft'));
        add_action('save_post', 'wpds_check_thumbnail');
    } else {
        delete_transient( "has_post_thumbnail" );
    }

}

function wpds_thumbnail_error() {
    if ( get_transient( "has_post_thumbnail" ) == "no" ) {
        echo "<div id='message' class='error'><p><strong>You must add a Featured Image before publishing this. Don't panic, your post is saved.</strong></p></div>";
        delete_transient( "has_post_thumbnail" );
    }
}

/*
// Remove SubMenu Admin Panel
function remove_submenus() {
  global $submenu;
    unset($submenu['index.php'][10]);
    unset($submenu['plugins.php'][10]);
    unset($submenu['plugins.php'][15]);
    unset($submenu['upload.php'][5]);
    unset($submenu['upload.php'][10]);
    unset($submenu['tools.php'][5]);
    unset($submenu['users.php'][5]);
    unset($submenu['users.php'][10]);
    unset($submenu['users.php'][15]);
    //unset($submenu['options-general.php'][25]);
}
add_action('admin_menu', 'remove_submenus');

// Hide Personal Options
function hide_personal_options(){
    echo "\n" . '<script type="text/javascript">jQuery(document).ready(function($) { $(\'form#your-profile > h2:first\').hide(); $(\'form#your-profile > h3:first\').hide(); $(\'form#your-profile > table:first\').hide(); $(\'form#your-profile\').show(); });</script>' . "\n";
}
add_action('admin_head','hide_personal_options');
*/

/**
 * This function will connect wp_mail to your authenticated
 * SMTP server. This improves reliability of wp_mail, and
 * avoids many potential problems.
 *
 * Values are constants set in wp-config.php
 */
add_action( 'phpmailer_init', 'send_smtp_email' );
function send_smtp_email( $phpmailer ) {
    $phpmailer->isSMTP();
    $phpmailer->Host       = SMTP_HOST;
    $phpmailer->SMTPAuth   = SMTP_AUTH;
    $phpmailer->Port       = SMTP_PORT;
    $phpmailer->Username   = SMTP_USER;
    $phpmailer->Password   = SMTP_PASS;
    $phpmailer->SMTPSecure = SMTP_SECURE;
    $phpmailer->From       = SMTP_FROM;
    $phpmailer->FromName   = SMTP_NAME;
}

/*
// Hide some plugins from user
add_filter( 'all_plugins', 'arwp_hide_plugins' );
function arwp_hide_plugins( $plugins ) {
    $hidearr = [
        'akismet/akismet.php',
        'ssl-insecure-content-fixer/ssl-insecure-content-fixer.php',
    ];
    foreach( $hidearr as $hide_me ) {
        if( in_array( $hide_me, array_keys( $plugins ) ) ) {
            unset( $plugins[$hide_me] );
        }
    }
    return $plugins;
}
*/

// Force setup permalinks wp-mu
add_action( 'wpmu_new_blog', function( $blog_id ) {
    switch_to_blog( $blog_id );
    global $wp_rewrite;
    $wp_rewrite->set_permalink_structure('/%year%/%monthnum%/%postname%');
    $wp_rewrite->flush_rules();
    restore_current_blog();
}, 10);

// ID column at sites list wp-mu
add_filter( 'wpmu_blogs_columns', 'do_get_id' );
add_action( 'manage_sites_custom_column', 'do_add_columns', 10, 2 );
add_action( 'manage_blogs_custom_column', 'do_add_columns', 10, 2 );
function do_add_columns( $column_name, $blog_id ) {
    if ( 'blog_id' === $column_name )
        echo $blog_id;
    return $column_name;
}
function do_get_id( $columns ) {
    $columns['blog_id'] = 'ID';
    return $columns;
}

// Custom dashboard widget
add_action('wp_dashboard_setup', 'arwp_custom_dashboard_widgets');
function arwp_custom_dashboard_widgets() {
    global $wp_meta_boxes;
    wp_add_dashboard_widget('arwp_custom_dashboard', 'Selamat Datang', 'arwp_custom_dashboard');
}
function arwp_custom_dashboard() {
    $msg  = '<p>Selamat datang di Sukabumi Online! Butuh bantuan? Hubungi tim pengembang <a href="mailto:developer@sukabumitoday.com">disini</a>.</p>';
    $msg .= '<p>Dapatkan informasi seputar Sukabumi terkini di <a href="//sukabumitoday.com" target="_blank">SukabumiToday</a>.</p>';
    echo $msg;
}
