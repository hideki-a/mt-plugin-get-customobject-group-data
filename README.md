# GetCustomObjectData Plugin

カスタムオブジェクトグループのグループIDやグループ名が取得できるようになります。

## 使い方

### `group_id`を指定して使用する

`group_id`を指定すると、IDで指定したカスタムオブジェクトグループの情報を取得できます。テンプレート内のどこでも使用できます。

```
<mt:CustomObjectGroupData group_id="1">
    <$mt:CustomObjectGroupName$>
</mt:CustomObjectGroupData>
```

### カスタムオブジェクトグループを指定するカスタムフィールドタグの中で使用する

カスタムフィールドで指定したカスタムオブジェクトグループの情報を取得できます。

```
<mt:PageCustomObjectSelect>
    <mt:CustomObjectGroupData>
        <$mt:CustomObjectGroupName$>
    </mt:CustomObjectGroupData>
</mt:PageCustomObjectSelect>
```

## 提供するタグ

### MTCustomObjectGroupName

カスタムオブジェクトグループの名称を表示します。

#### `brackets`モディファイアについて

`<$mt:CustomObjectGroupName brackets="1"$>`とすると、カスタムオブジェクトグループ名の`[〜]`の内容のみを出力します。

<dl>
<dt>グループ名</dt>
<dd>トヨタ [TOYOTA]</dd>
<dt>出力結果</dt>
<dd>TOYOTA</dd>
</dl>

### MTCustomObjectGroupID

カスタムオブジェクトグループのIDを表示します。

### MTCustomObjectGroupContentsCount

カスタムオブジェクトグループ内のオブジェクト数を表示します。
