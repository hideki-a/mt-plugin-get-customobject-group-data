package GetCustomObjectGroupName::Tags;
use strict;
use CustomFields::Util qw( get_meta );
use CustomObject::CustomObjectGroup;

sub _hdlr_custom_object_group_data{
    my ($ctx, $args, $cond) = @_;
    my $entry = $ctx->stash('entry');
    my $field_name = $ctx->stash('field')->basename;
    my $meta = get_meta($entry);
    my $group_id = $meta->{ $field_name };
    my @groups = CustomObject::CustomObjectGroup->load( $group_id );
    my $out;

    for my $group (@groups) {
        local $ctx->{__stash}{customobjectgroupdata} = $group;
        my $tokens = $ctx->stash('tokens');
        my $builder = $ctx->stash('builder');

        $out .= $builder->build( $ctx, $tokens, $cond )
            || return $ctx->error( $builder->errstr );
    }

    return $out;
}

sub _hdlr_custom_object_group_name {
    my ($ctx, $args) = @_;
    my $group = $ctx->stash('customobjectgroupdata')
        || $ctx->error('You used an CustomObjectGroupName tag outside of the proper context.');

    if ($group) {
        return $group->name;
    }
}

sub _hdlr_custom_object_group_id {
    my ($ctx, $args) = @_;
    my $group = $ctx->stash('customobjectgroupdata')
        || $ctx->error('You used an CustomObjectGroupID tag outside of the proper context.');

    if ($group) {
        return $group->id;
    }
}

1;
