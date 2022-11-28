<script>
  let text = "Click the button to send a request";
  let url = "";
  let token = "";

  const sendRequest = async (method) => {
    text = `Sending a new message to '${url}'`
    console.log(text)
  
    if (!url) {
      text = "No URL specified!"
      console.log(text)
      return;
    }
  
    let tokenHeaders = {};
    if (token) {
      tokenHeaders['x-github-token'] = token
    }

    let body = undefined;
    if (method == "POST" || method == "PUT") {
      body = JSON.stringify({ "id": 78912 })
    }
  
    try {
      const res = await fetch(url, {
        method: method,
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            ...tokenHeaders
        },
        body: body,
      });
      text = `Response: ${res.status}`;
      console.log(text)
    } catch (e) {
      text = `Something went wrong: ${e}`
      console.log(text)
    }
  }
</script>

<div>
  <p>{text}</p>
  <form>
    <div>
      <label for="url">PFS URL</label>
      <input type="text" id="url" bind:value={url} />
    </div>
    <div>
      <label for="toke">GitHub token</label>
      <input type="password" id="text" bind:value={token} />
    </div>
  </form>
</div>
<div>
  <button on:click={() => sendRequest("GET")}>Send GET request</button>
  <button on:click={() => sendRequest("POST")}>Send POST requeest</button>
  <button on:click={() => sendRequest("PUT")}>Send PUT request</button>
  <button on:click={() => sendRequest("DELETE")}>Send DELETE request</button>
  <button>Connect to WebSocket</button>
</div>
