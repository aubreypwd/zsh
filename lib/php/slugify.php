<?php // @codingStandardsIgnoreStart:

/**
 * Slugify String.
 *
 * @author Aubrey Portwood <code@aubreypwd.com>
 * @since  7/22/2019
 * @param  string $text String.
 * @return string       Slugified string.
 */
function slugify( string $text ) : string {

	// replace non letter or digits by -
	$text = preg_replace( '~[^\pL\d]+~u', '-', $text );

	// transliterate
	$text = iconv( 'utf-8', 'us-ascii//TRANSLIT', $text );

	// remove unwanted characters
	$text = preg_replace( '~[^-\w]+~', '', $text );

	// trim
	$text = trim( $text, '-' );

	// remove duplicate -
	$text = preg_replace( '~-+~', '-', $text );

	// lowercase
	$text = strtolower( $text );

	if ( empty( $text ) ) {
		return 'n-a';
	}

	return $text;
}
