package GetCustomObjectGroupName::Tags;
use strict;
use CustomFields::Util qw( get_meta );
use CustomObject::CustomObjectGroup;

sub _hdlr_custom_object_group_name {
    my ($ctx, $args) = @_;
    my $entry = $ctx->stash('entry');
    my $field_name = $ctx->stash('field')->basename;
    my $meta = get_meta($entry);
    my $group_id = $meta->{ $field_name };
    my $group = CustomObject::CustomObjectGroup->load( $group_id );

    return $group->name;
}

1;
