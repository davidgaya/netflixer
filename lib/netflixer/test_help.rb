def fake_netflix
  # fake title_states
  FakeWeb.register_uri(:get, %r|http://api\.netflix\.com/users/.*/title_states|, :body => PredefinedResponse.title_states)
end

class PredefinedResponse
  class << self
    def title_states
      %{<?xml version="1.0" standalone="yes"?>

        <title_states>
          <url_template>http://api.netflix.com/users/BQAJAAEDENxJiBbVGYSl5YS2h6WmRGUgjrzPw1Pfrej2MeTct7zTBDk6k_4zMGst9RkKV4ZwfJQ./title_states?{-join|&amp;|title_refs}</url_template>
          <title_state>
            <link href="http://api.netflix.com/catalog/titles/movies/512381" rel="http://schemas.netflix.com/catalog/title" title="Fly Away Home"></link>
            <title_state_item>
              <link href="http://api.netflix.com/users/BQAJAAEDENxJiBbVGYSl5YS2h6WmRGUgjrzPw1Pfrej2MeTct7zTBDk6k_4zMGst9RkKV4ZwfJQ./queues/instant" rel="http://schemas.netflix.com/queues.instant" title="instant queue"></link>
              <format>
                <category scheme="http://api.netflix.com/categories/title_formats" label="Instant" term="Instant"></category>
                <category scheme="http://api.netflix.com/categories/title_states" label="Play" term="Play"></category>
                <category scheme="http://api.netflix.com/categories/title_states" label="Add" term="Add"></category>
              </format>
            </title_state_item>
            <title_state_item>
              <link href="http://api.netflix.com/users/BQAJAAEDENxJiBbVGYSl5YS2h6WmRGUgjrzPw1Pfrej2MeTct7zTBDk6k_4zMGst9RkKV4ZwfJQ./queues/disc" rel="http://schemas.netflix.com/queues.disc" title="disc queue"></link>
              <format>
                <preferred_format>true</preferred_format>
                <category scheme="http://api.netflix.com/categories/title_formats" label="DVD" term="DVD"></category>
                <category scheme="http://api.netflix.com/categories/title_states" label="Add" term="Add"></category>
              </format>
            </title_state_item>
          </title_state>
        </title_states>
      }
    end
  end
end
