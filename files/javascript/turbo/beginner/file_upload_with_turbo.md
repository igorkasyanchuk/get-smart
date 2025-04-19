## 📤 File Uploads with Turbo
Turbo supports file uploads automatically. Add `multipart/form-data` to your form and include a file input. Turbo will send the file via XHR.

```html
<form action="/upload" method="post" enctype="multipart/form-data">
  <input type="file" name="photo[file]" />
  <button type="submit">Upload Photo</button>
</form>
```