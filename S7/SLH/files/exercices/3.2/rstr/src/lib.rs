use unicode_segmentation::UnicodeSegmentation;

pub fn reverse_string(s: &str) -> String {
    s.graphemes(true).rev().collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ascii() {
        assert_eq!(&reverse_string("Hello, world!"), "!dlrow ,olleH");
    }

    #[test]
    fn unicode() {
        assert_eq!(&reverse_string("Dès noël où mon cœur haït le zéphyr"), 
            "ryhpéz el tïah ruœc nom ùo lëon sèD");
    }
    
    #[test]
    fn emoji() {
        assert_eq!(&reverse_string("🇮🇱🕊🇮🇷"), "🇮🇷🕊🇮🇱");
    }

}
