<script>
  let text = "Click the button to send a request";
  let url = "";
  let token = "";

  const onSubmit = async (e) => {
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

    try {
      const res = await fetch(url, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            ...tokenHeaders
        },
        body: JSON.stringify({ "id": 78912 }),
      });
      text = `Response: ${res.status}`;
      console.log(text)
    } catch {
      text = 'Something went wrong'
      console.log(text)
    }
  };
</script>

<div>
  <p>{text}</p>
  <form on:submit|preventDefault={onSubmit}>
    <div>
      <label for="url">PFS URL</label>
      <input type="text" id="url" bind:value={url} />
    </div>
    <div>
      <label for="toke">GitHub token</label>
      <input type="text" id="text" bind:value={token} />
    </div>
    <button type="submit">Send request</button>
  </form>
</div>
