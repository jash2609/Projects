package com.github.teamasia.heartrider.events;

import com.github.teamasia.heartrider.data.TagData;

public class TagAddedEvent {
    private TagData mTagData;

    public TagAddedEvent(TagData pTagData) {
        mTagData = pTagData;
    }

    public TagData getTag() {
        return mTagData;
    }
}
