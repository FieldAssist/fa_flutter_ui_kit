# FA Flutter UI Kit

Official FA Flutter UI Kit.

## Getting Started

- Import the 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart' to get all the widgets in your projects that are avilable in FA Flutter UI Kit.FieldAssist

## List of Widgets in UI Kit.

| 1. Internet Not Available | 2. Bottom Action Button | 3. My Circular Progress | 
| ------------------------- | ------------------------ | -------------------------- | 
| <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/internetnotavilable.gif" width="250" height="500"> | <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/bottom_action_button.gif" width="250" height="500"> | <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/my_circular_progress.gif" width="250" height="500"> | 

| 4. My Linear Progress Indicator | 5. No Items Found | 6. Outlined Icon Button |
| ------------------------- | ------------------------- | ------------------------ |
| <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/linear_progress_indicator.gif" width="250" height="500"> | <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/no_items_found.gif" width="250" height="500"> | <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/outlined_icon_button.gif" width="250" height="500"> |

| 7. Responsive Container | 8. Stream Loading Widget | 9. Search Text Field |
|  -------------------------- | ------------------------- | ------------------------- |
| <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/responsive_container.gif" width="250" height="500"> | <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/stream_loading.gif" width="250" height="500"> | <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/search_text_field.gif" width="250" height="500"> |

| 10. Generic Dialog | 11. Progress Dialog | 12. Searchable DropDown |
|  -------------------------- | ------------------------- | ------------------------- |
| <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/generic_dialog.gif" width="250" height="500"> | <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/progress_dialog.gif" width="250" height="500"> | <img src="https://github.com/FieldAssist/fa_flutter_ui_kit/blob/main/assets/gif/dropdown.gif" width="250" height="500"> |


## Extra(s)

- FA Flutter Best Practices: https://github.com/FieldAssist/fa_flutter_docs)
- For Json building or editing auto route
```
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

### Configs required to use Qr_code_scanner
- in app level build.gradle
```
compileSdkVersion 32
```
- Project level build.gradle
```
    dependencies {
        classpath 'com.android.tools.build:gradle:4.2.0'
        ...
        ...
    }
```
- in android/gradle/wrapper/gradle-wrapper.properties
```
    distributionUrl=https\://services.gradle.org/distributions/gradle-6.9-all.zip
```
- usage
```
    final scannedCode = await Navigator.push(context, MaterialPageRoute(builder: (context) => QrCodeScanner()));
```

## ✨ Active Contributors

<table>
<tr>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/TusharFA>
            <img src=https://avatars.githubusercontent.com/u/82998121?v=4 width="100;"  alt=Tushar Sharma/>
            <br />
            <sub style="font-size:14px"><b>Tushar Sharma</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/namanpopli>
            <img src=https://avatars.githubusercontent.com/u/46225601?v=4 width="100;"  alt=Naman Popli/>
            <br />
            <sub style="font-size:14px"><b>Naman Popli</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/singhtaranjeet>
            <img src=https://avatars.githubusercontent.com/u/22328750?v=4 width="100;"  alt=Taranjeet Singh/>
            <br />
            <sub style="font-size:14px"><b>Taranjeet Singh</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Ritsz123>
            <img src=https://avatars.githubusercontent.com/u/48131636?v=4 width="100;"  alt=Ritesh Khadse/>
            <br />
            <sub style="font-size:14px"><b>Ritesh Khadse</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/apgapg>
            <img src=https://avatars.githubusercontent.com/u/13887407?v=4 width="100;"  alt=Ayush P Gupta/>
            <br />
            <sub style="font-size:14px"><b>Ayush P Gupta</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Khushboo1702>
            <img src=https://avatars.githubusercontent.com/u/113587610?v=4 width="100;"  alt=Khushboo Agrawal/>
            <br />
            <sub style="font-size:14px"><b>Khushboo Agrawal</b></sub>
        </a>
    </td>
</tr>
<tr>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Sam1kumar>
            <img src=https://avatars.githubusercontent.com/u/86761543?v=4 width="100;"  alt=Sameer Kumar/>
            <br />
            <sub style="font-size:14px"><b>Sameer Kumar</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/vatsal201>
            <img src=https://avatars.githubusercontent.com/u/85787993?v=4 width="100;"  alt=Vatsal Gandhi/>
            <br />
            <sub style="font-size:14px"><b>Vatsal Gandhi</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Aashishm178>
            <img src=https://avatars.githubusercontent.com/u/43882770?v=4 width="100;"  alt=Aashish Rathore/>
            <br />
            <sub style="font-size:14px"><b>Aashish Rathore</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Vipin9821>
            <img src=https://avatars.githubusercontent.com/u/50833659?v=4 width="100;"  alt=Vipin Vishwakarma/>
            <br />
            <sub style="font-size:14px"><b>Vipin Vishwakarma</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/devbindal>
            <img src=https://avatars.githubusercontent.com/u/81467330?v=4 width="100;"  alt=Dev Bindal/>
            <br />
            <sub style="font-size:14px"><b>Dev Bindal</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Abhisheksainii>
            <img src=https://avatars.githubusercontent.com/u/78199221?v=4 width="100;"  alt=Abhishek Saini/>
            <br />
            <sub style="font-size:14px"><b>Abhishek Saini</b></sub>
        </a>
    </td>
</tr>
<tr>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/kapdroid>
            <img src=https://avatars.githubusercontent.com/u/144016021?v=4 width="100;"  alt=kapdroid/>
            <br />
            <sub style="font-size:14px"><b>kapdroid</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Khushhbboo>
            <img src=https://avatars.githubusercontent.com/u/84172644?v=4 width="100;"  alt=Khushhbboo/>
            <br />
            <sub style="font-size:14px"><b>Khushhbboo</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Tushar2212>
            <img src=https://avatars.githubusercontent.com/u/29337816?v=4 width="100;"  alt=Tushar Sharma/>
            <br />
            <sub style="font-size:14px"><b>Tushar Sharma</b></sub>
        </a>
    </td>
</tr>
</table>

<table>
  <tr>
    <td align="center"><a href="https://github.com/apgapg"><img src="https://avatars0.githubusercontent.com/u/13887407?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Ayush P Gupta</b></sub></a><br /></td> 
    <td align="center"><a href="https://github.com/someshubham"><img src="https://avatars0.githubusercontent.com/u/49554541?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Shubham Jain</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/samvitjain"><img src="https://avatars0.githubusercontent.com/u/40051776?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Samvit Jain</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/Aashishm178"><img src="https://avatars0.githubusercontent.com/u/43882770?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Aashish Rathore</b></sub></a><br /></td>
  </tr>

</table>
