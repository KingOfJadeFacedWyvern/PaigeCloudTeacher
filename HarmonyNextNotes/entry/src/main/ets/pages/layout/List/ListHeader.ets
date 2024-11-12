import { util } from '@kit.ArkTS'

@Entry
@Component
struct ListHeader {
  @Builder
  ItemHeader (title: string) {
    Text (title)
      .width ('100%')
      .height (50)
      .backgroundColor (Color.Gray)
      .fontColor (Color.White)
  }

  build () {
    Column () {
      List ({space: 10}) {
        ForEach (contactsGroups , (contactsGroups: ContactsGroups , index: number) => {
          ListItemGroup ({
            header: this.ItemHeader (contactsGroups.title),
            space: 10
          }) {
            ForEach (contactsGroups.contacts , (contact: Contact , index: number) => {
              ListItem () {
                Row ({space: 10}) {
                  Image (contact.icon)
                    .width (30)
                    // .height (50)
                  Text (contact.name)
                }
              }

            })


          }

        })
      }
      .sticky(StickyStyle.Header)

    }

  }
}

class Contact {
  key: string = util.generateRandomUUID ();
  name: string;
  icon: Resource;

  constructor (name: string , icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}

export class ContactsGroups {
  title: string = ''
  contacts: Array<object> | null = null
  key: string = ''
}

export let contactsGroups: ContactsGroups[] = [
  {
    title: 'A' ,
    contacts: [
      new Contact ('Aaron' , $r("app.media.app_icon")),
      new Contact ('Abbey' , $r("app.media.app_icon")),
      new Contact ('Abbey' , $r("app.media.app_icon")),
    ] ,
    key: util.generateRandomUUID (true)
  } as ContactsGroups,
  {
    title: 'B' ,
    contacts: [
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
    ] ,
    key: util.generateRandomUUID (true)
  },
  {
    title: 'C' ,
    contacts: [
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
    ] ,
    key: util.generateRandomUUID (true)
  },
  {
    title: 'D' ,
    contacts: [
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
      new Contact ('Bob' , $r("app.media.app_icon")),
    ] ,
    key: util.generateRandomUUID (true)
  }

]