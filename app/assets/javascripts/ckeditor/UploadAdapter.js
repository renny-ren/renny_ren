//@ts-nocheck

const OSS_IMAGE_DIR = "https://renny-assets.oss-cn-chengdu.aliyuncs.com/images/user/"

export default class UploadAdapter {
  constructor(loader, options) {
    this.loader = loader
    this.options = options
  }

  upload() {
    return this.loader.file.then(
      (file) =>
        new Promise(async (resolve, reject) => {
          const url = `${OSS_IMAGE_DIR}${file.name}`
          this._initRequest()
          this._initListeners(resolve, reject, url)
          this._sendRequest(file)
        }),
    )
  }

  abort() {
    if (this.xhr) {
      this.xhr.abort()
    }
  }

  async _initRequest() {
    const xhr = (this.xhr = new XMLHttpRequest())

    xhr.open( 'POST', '/uploads', true );
    xhr.responseType = 'json';
  }

  _initListeners(resolve, reject, url) {
    const xhr = this.xhr
    const loader = this.loader
    const genericErrorText = `Couldn't upload file`

    xhr.addEventListener('error', () => reject(genericErrorText))
    xhr.addEventListener('abort', () => reject())
    xhr.addEventListener('load', () => {
      if (xhr.status !== 200) {
        return reject(`${genericErrorText}, upload status: ${xhr.status}`)
      }

      resolve({ default: url })
    })

    // Upload progress when it is supported.
    /* istanbul ignore else */
    if (xhr.upload) {
      xhr.upload.addEventListener('progress', (evt) => {
        if (evt.lengthComputable) {
          loader.uploadTotal = evt.total
          loader.uploaded = evt.loaded
        }
      })
    }
  }

  _sendRequest(file) {
    // Set headers if specified.
    // const headers = this.options.headers || {}

    // // Use the withCredentials flag if specified.
    // const withCredentials = this.options.withCredentials || false

    // for (const headerName of Object.keys(headers)) {
    //   this.xhr.setRequestHeader(headerName, headers[headerName])
    // }

    // this.xhr.withCredentials = withCredentials

    // Prepare the form data.
    const data = new FormData();

    data.append('upload', file);
    data.append('authenticity_token', $('[name="csrf-token"]')[0].content);

    this.xhr.send(data);
  }
}
