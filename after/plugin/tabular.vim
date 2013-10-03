if !exists(':Tabularize')
  finish " Give up here; the Tabular plugin musn't have been loaded
endif

AddTabularPattern! symbols         / :/l0
AddTabularPattern! hash            /^[^>]*\zs=>/
AddTabularPattern! chunks          / \S\+/l0
AddTabularPattern! assignment      / = /l0
AddTabularPattern! comma           /^[^,]*,/l1
AddTabularPattern! colon           /:\zs /l0
AddTabularPattern! options_hashes  /:\w\+ =>/
