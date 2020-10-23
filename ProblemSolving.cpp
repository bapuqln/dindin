/*
Given a string str consisting of letters only and an integer n, the task is to replace every character of the given string by a character which is n times more than it. If the letter exceeds ‘z’, then start checking from ‘a’ in a cyclic manner.

Examples:
Input: str = “abc”, n = 2
Output: cde
a is moved by 2 times which results in character c
b is moved by 2 times which results in character d
c is moved by 2 times which results in character e

Input: str = “abc”, n= 28
Output: cde
a is moved 25 times, z is reached. Then the 26th character will be a, 27th b and 28th c.
b is moved 24 times, z is reached. 28-th is d.
c is moved 23 times, z is reached. 28-th is f.

Question: 
a/ Write an algorithm to solve the above issue. Please consider the complexity of the algorithm.
b/ What is the disadvantage of using the ASCII value of the letters to solve this problem?
*/

#include <iostream>
#include <vector>
#include <climits>

using namespace std;

class Solution{
public:
	string solve(const string& input, int k) {
		if (k <= 0 || input.empty())
			return input;

		string ans;
		k = k % 26;

		for (const char& c : input) {
			if (c + k > 'z')
				ans += ('a' + ('z' - c));
			else
				ans += (c + k);
		}

		return ans;
	}
	// Time Complexity will be O(N) {N is length of input}
};

int main() {

	// ios_base::sync_with_stdio(false);
	// cin.tie(nullptr);

	vector<pair<string, int>> pairs {
		make_pair("abc", 2),
		make_pair("ABC", 2),
		make_pair("abc", 28),
		make_pair("abcy", 2), 
		make_pair("abcz", 28), 
		make_pair("abcz", 100000000), 
		make_pair("abcdefajklasdjfkljgkjksdjfkez", INT_MAX),
		make_pair("jjj111", INT_MIN)
	};

	Solution sol;
	for (const auto& pair: pairs) {
		string ans = sol.solve(pair.first, pair.second);
		cout << "Case # " << pair.first << " : " << pair.second << " = " << ans << endl;
	}

	/**
		Case # abc : 2 = cde
		Case # abc : 28 = cde
		Case # abcy : 2 = cdeb
		Case # abcz : 28 = cdea
		Case # abcz : 100000000 = wxya
		Case # abcdefajklasdjfkljgkjksdjfkez : 2147483647 = xyzwvuxqpoxhwqupoqtpqphwqupva
		Case # jjj111 : -2147483648 = jjj111
	*/

}