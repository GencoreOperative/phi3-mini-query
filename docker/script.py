import onnxruntime_genai as og
import argparse
import sys

def main(args):
    input_text = args.input_text
    if input_text == "":
        print("Error: Input text is missing")
        sys.exit(1)  # Exit with a non-zero exit code

    if args.verbose: 
            print("Input Text:")
            print(input_text)
            print("Input Text:")

    try:
        model = og.Model(f'{args.model}')
        tokenizer = og.Tokenizer(model)
        tokenizer_stream = tokenizer.create_stream()
        search_options = {name:getattr(args, name) for name in ['do_sample', 'max_length', 'min_length', 'top_p', 'top_k', 'temperature', 'repetition_penalty'] if name in args}
        
        if 'max_length' not in search_options:
            search_options['max_length'] = 2048
        
        chat_template = '\n{input}\n'

        prompt = f'{chat_template.format(input=input_text)}'
        input_tokens = tokenizer.encode(prompt)

        params = og.GeneratorParams(model)
        params.try_use_cuda_graph_with_max_batch_size(1)
        params.set_search_options(**search_options)
        params.input_ids = input_tokens
        generator = og.Generator(model, params)

        print("", end='', flush=True)
        while not generator.is_done():
            generator.compute_logits()
            generator.generate_next_token()
            new_token = generator.get_next_tokens()[0]
            print(tokenizer_stream.decode(new_token), end='', flush=True)

        del generator

    except Exception as e:
        print(f"An error occurred during generation: {e}")
        sys.exit(1)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="End-to-end AI Question/Answer example for gen-ai")
    parser.add_argument('-m', '--model', type=str, required=True, help='Onnx model folder path (must contain config.json and model.onnx)')
    parser.add_argument('-v', '--verbose', action='store_true', default=False, help='Print verbose output and timing information. Defaults to false')
    parser.add_argument('input_text', type=str, help='Input text')
    args = parser.parse_args()
    main(args)
