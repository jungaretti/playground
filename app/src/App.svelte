<script>
  let text = "Click a button to send a request";
  let url = "";
  let githubToken = "";
  let basisToken = "";

  const sendRequest = async (method) => {
    text = `Sending a new message to '${url}'`
    console.log(text)
  
    if (!url) {
      text = "No URL specified!"
      console.log(text)
      return;
    }
  
    let tokenHeaders = {};
    if (githubToken) {
      tokenHeaders['x-github-token'] = githubToken
    }
    if (basisToken) {
      tokenHeaders['X-Tunnel-Authorization'] = `tunnel ${basisToken}`
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
      <label for="url">Request URL</label>
      <input type="text" id="url" bind:value={url} />
    </div>
    <div>
      <label for="github-token">X-GitHub-Token</label>
      <input type="password" id="github-token" bind:value={githubToken} />
    </div>
    <div>
      <label for="basis-token">X-Tunnel-Authorization</label>
      <input type="password" id="basis-token" bind:value={basisToken} />
    </div>
  </form>
</div>
<div>
  <button on:click={() => sendRequest("GET")}>Send GET request</button>
  <button on:click={() => sendRequest("POST")}>Send POST request</button>
  <button on:click={() => sendRequest("PUT")}>Send PUT request</button>
  <button on:click={() => sendRequest("DELETE")}>Send DELETE request</button>
</div>
