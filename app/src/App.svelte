<script>
  let text = "Click the button to send a request";

  const handleClick = async () => {
    text = "Sending a new message to API"
    console.log(text)

    const url = "http://127.0.0.1:3000/api/hello";
    const res = await fetch(url);
    const data = await res.json();

    text = `Response: ${res.status} ${data.message.text}`;
    console.log(text)
  };
</script>

<div>
  <button on:click={handleClick}>Send request to API</button>
  <p>{text}</p>
</div>
