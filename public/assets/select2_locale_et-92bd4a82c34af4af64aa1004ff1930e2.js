!function(t){"use strict";t.extend(t.fn.select2.defaults,{formatNoMatches:function(){return"Tulemused puuduvad"},formatInputTooShort:function(t,e){var n=e-t.length;return"Sisesta "+n+" täht"+(1==n?"":"e")+" rohkem"},formatInputTooLong:function(t,e){var n=t.length-e;return"Sisesta "+n+" täht"+(1==n?"":"e")+" vähem"},formatSelectionTooBig:function(t){return"Saad vaid "+t+" tulemus"+(1==t?"e":"t")+" valida"},formatLoadMore:function(){return"Laen tulemusi.."},formatSearching:function(){return"Otsin.."}})}(jQuery);